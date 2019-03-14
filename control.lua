-- tint for ulti, new tech graphic
-- todo deactivate when not-our-belt is placed right in front of us
-- todo config for overriding max, min(?) distance, reset buttons for sliders
-- todo detect if we're pathing over existing undergrounds that'll interfere with our planned path
-- todo option for leaving space around obstacles
local scan_max_distance = 1000
local belt_type_mapping = {
  -- yellow
  ["replicating-transport-belt"] = {
    belt = "transport-belt",
    underground = "underground-belt",
  },
  -- red
  ["replicating-fast-transport-belt"] = {
    belt = "fast-transport-belt",
    underground = "fast-underground-belt",
  },
  -- blue
  ["replicating-express-transport-belt"] = {
    belt = "express-transport-belt",
    underground = "express-underground-belt",
  },
  -- 5dim mk4
  ["replicating-5d-mk4-transport-belt"] = {
    belt = "5d-mk4-transport-belt",
    underground = "5d-mk4-transport-belt-to-ground",
  },
  -- 5dim mk5
  ["replicating-5d-mk5-transport-belt"] = {
    belt = "5d-mk5-transport-belt",
    underground = "5d-mk5-transport-belt-to-ground",
  },
  -- yellow blood
  ["replicating-blood-belt"] = {
    belt = "blood-belt",
    underground = "underground-belt",
    autoconnect = true,
  },
  -- red blood
  ["replicating-fast-blood-belt"] = {
    belt = "blood-belt-fast",
    underground = "fast-underground-belt",
    autoconnect = true,
  },
  -- blue blood
  ["replicating-express-blood-belt"] = {
    belt = "blood-belt-express",
    underground = "express-underground-belt",
    autoconnect = true,
  },
  -- extended blistering
  ["replicating-blistering-transport-belt"] = {
    belt = "blistering-transport-belt",
    underground = "blistering-transport-belt-to-ground",
  },
  -- extended furious
  ["replicating-furious-transport-belt"] = {
    belt = "furious-transport-belt",
    underground = "furious-transport-belt-to-ground",
  },
  -- extendedplus mk1
  ["replicating-rapid-transport-belt-mk1"] = {
    belt = "rapid-transport-belt-mk1",
    underground = "rapid-transport-belt-to-ground-mk1",
  },
  -- extendedplus mk2
  ["replicating-rapid-transport-belt-mk2"] = {
    belt = "rapid-transport-belt-mk2",
    underground = "rapid-transport-belt-to-ground-mk2",
  },
  -- bob's purple
  ["replicating-turbo-transport-belt"] = {
    belt = "turbo-transport-belt",
    underground = "turbo-underground-belt",
  },
  -- bob's green
  ["replicating-ultrabob-transport-belt"] = {
    belt = "ultimate-transport-belt",
    underground = "ultimate-underground-belt",
  },
  -- dp77 swift
  ["replicating-swift-transport-belt"] = {
    belt = "swift-transport-belt",
    underground = "swift-underground-belt",
  },
  -- dp77 elite
  ["replicating-elite-transport-belt"] = {
    belt = "elite-transport-belt",
    underground = "elite-underground-belt",
  },
  -- dp77 sonic
  ["replicating-sonic-transport-belt"] = {
    belt = "sonic-transport-belt",
    underground = "sonic-underground-belt",
  },
  -- dp77 hyper
  ["replicating-hyper-transport-belt"] = {
    belt = "hyper-transport-belt",
    underground = "hyper-underground-belt",
  },
  -- dp77 stealt
  ["replicating-stealt-transport-belt"] = {
    belt = "stealt-transport-belt",
    underground = "stealt-underground-belt",
  },
  -- dp77 giga
  ["replicating-giga-transport-belt"] = {
    belt = "giga-transport-belt",
    underground = "giga-underground-belt",
  },
  -- ultimate t1
  ["replicating-ultra-fast-belt"] = {
    belt = "ultra-fast-belt",
    underground = "ultra-fast-underground-belt",
  },
  -- ultimate t2
  ["replicating-extreme-fast-belt"] = {
    belt = "extreme-fast-belt",
    underground = "extreme-fast-underground-belt",
  },
  -- ultimate t3
  ["replicating-ultra-express-belt"] = {
    belt = "ultra-express-belt",
    underground = "ultra-express-underground-belt",
  },
  -- ultimate t4
  ["replicating-extreme-express-belt"] = {
    belt = "extreme-express-belt",
    underground = "extreme-express-underground-belt",
  },
  -- ultimate t5
  ["replicating-ultimate-transport-belt"] = {
    belt = "ultimate-belt",
    underground = "original-ultimate-underground-belt",
  },
}

local underground_distances = {}
do
  -- we need to know each underground belt type's max distance but we can't query the game object 
  -- during loading for the value from the prototype (and many mods change these values, so we can't hardcode stock)
  -- work around this by waiting until the max_distance key gets read the first time for each belt type, then populate it
  local distance_lookup_metatable = {
    __index = function(table, key)
      local distance = game.entity_prototypes[key].max_underground_distance
      table[key] = distance
      return distance
    end
  }
  underground_distances = setmetatable(underground_distances, distance_lookup_metatable)
end

local function config_default(belt_name, key)
  if key == "prefer_underground" then
    return false
  elseif key == "underground" then
    return belt_type_mapping[belt_name].underground
  end
end
local function get_config(player_index, belt_name, key)
  if not global.rbconfig then
    global.rbconfig = {}
  end
  if global.rbconfig[player_index] and global.rbconfig[player_index][belt_name] and global.rbconfig[player_index][belt_name][key] then
    -- the player has configured this, use their setting
    return global.rbconfig[player_index][belt_name][key]
  else
    -- unconfigured, use the default
    return config_default(belt_name, key)
  end
end

-- these are used a lot in frequently-called functions in this file - make them local to cut down on table lookups
local north = defines.direction.north
local south = defines.direction.south
local east = defines.direction.east
local west = defines.direction.west

-- some data mappings to help the scanner quickly make decisions and keep the direction logic organized
-- this one is for what directions we should look when we get an entity placed in each direction for other peers pointing at us
local scan_directions = {
  [north] = {
    south,
    east,
    west,
  },
  [south] = {
    north,
    east,
    west,
  },
  [east] = {
    north,
    south,
    west,
  },
  [west] = {
    north,
    south,
    east,
  },
}
-- this one is for when we're scanning forward, and want to match entites facing any direction but directly toward us
local facing_any_but_opposite_filters = {
  [north] = {
    [north] = true,
    --south = nil,
    [east] = true,
    [west] = true,
  },
  [south] = {
    --north = nil,
    [south] = true,
    [east] = true,
    [west] = true,
  },
  [east] = {
    [north] = true,
    [south] = true,
    [east] = true,
    --west = nil,
  },
  [west] = {
    [north] = true,
    [south] = true,
    --east = nil,
    [west] = true,
  },
}
-- and this is for when we're scanning backward/sideways, and will match belts that face us directly
local facing_toward_the_scanner_filters = {
  [north] = {
    [south] = true,
  },
  [south] = {
    [north] = true,
  },
  [east] = {
    [west] = true,
  },
  [west] = {
    [east] = true,
  },
}

local function get_neighbor_entities(entity, search_direction)
  local neighbor
  if search_direction == north then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x, entity.position.y-1},
      force = entity.force,
    })
  elseif search_direction == south then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x, entity.position.y+1},
      force = entity.force,
    })
  elseif search_direction == east then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x+1, entity.position.y},
      force = entity.force,
    })
  elseif search_direction == west then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x-1, entity.position.y},
      force = entity.force,
    })
  end
  return neighbor
end

local function get_neighbor_belt(entity, search_direction, direction_filter)
  local neighbor
  if search_direction == north then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x, entity.position.y-1},
      type = "transport-belt",
      force = entity.force,
    })
  elseif search_direction == south then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x, entity.position.y+1},
      type = "transport-belt",
      force = entity.force,
    })
  elseif search_direction == east then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x+1, entity.position.y},
      type = "transport-belt",
      force = entity.force,
    })
  elseif search_direction == west then
    neighbor = entity.surface.find_entities_filtered({
      position = {entity.position.x-1, entity.position.y},
      type = "transport-belt",
      force = entity.force,
    })
  end
  if neighbor and neighbor[1] and direction_filter[neighbor[1].direction] then
    return neighbor[1]
  end
end
-- For blood belt compatibility, our own belts should support autoconnecting (and defaulting to
-- read/hold/no-enable-disable) to neighbor belts if the flag is set for the type
-- Be more aggressive than the blood belts in allowing linking to any type of belt, but
-- more selective in which neighbors we link to using the replication scanning logic (to allow parallel blood belts that don't intermingle)
local function try_autoconnect(entity)
  local position = entity.position
  for _, v in pairs(scan_directions[entity.direction]) do
    local neighbor = get_neighbor_belt(entity, v, facing_toward_the_scanner_filters[v])
    if neighbor then
      entity.connect_neighbour({
        wire = defines.wire_type.red,
        target_entity = neighbor,
      })
      local cb = neighbor.get_or_create_control_behavior()
      cb.enable_disable = false
      cb.read_contents = true
      cb.read_contents_mode = defines.control_behavior.transport_belt.content_read_mode.hold
    end
  end
  local neighbor = get_neighbor_belt(entity, entity.direction, facing_any_but_opposite_filters[entity.direction])
  if neighbor then
    entity.connect_neighbour({
      wire = defines.wire_type.red,
      target_entity = neighbor,
    })
    local cb = neighbor.get_or_create_control_behavior()
    cb.enable_disable = false
    cb.read_contents = true
    cb.read_contents_mode = defines.control_behavior.transport_belt.content_read_mode.hold
  end
  local cb = entity.get_or_create_control_behavior()
  cb.enable_disable = false
  cb.read_contents = true
  cb.read_contents_mode = defines.control_behavior.transport_belt.content_read_mode.hold
end

local function can_build_in_spot(source_entity, distance)
  local target_position
  if source_entity.direction == north then
    target_position = {source_entity.position.x, source_entity.position.y-distance}
  elseif source_entity.direction == south then
    target_position = {source_entity.position.x, source_entity.position.y+distance}
  elseif source_entity.direction == east then
    target_position = {source_entity.position.x+distance, source_entity.position.y}
  elseif source_entity.direction == west then
    target_position = {source_entity.position.x-distance, source_entity.position.y}
  end

  return source_entity.surface.can_place_entity({
    name = source_entity.name,
    position = target_position,
    direction = source_entity.direction,
    force = source_entity.force,
    build_check_type = defines.build_check_type.ghost_place,
  })
end

-- magic numbers for our build plan arrays instead of storing anything heavier there
local build_plan_belt = 1
local build_plan_skip = 2
local build_plan_input = 3
local build_plan_output = 4

-- keep these references out here and reuse the same tables to reduce the GC churn
local placability = {}
local build_plan = {}

-- track which belts were involved in some way with the current replication, to test if we need to downconvert them later
local touched_belts = {}
local function check_path(source_entity, dest_entity, path_distance, player_index)
  local config_player = player_index
  if not config_player then
    -- it's a bot build, so we don't have a direct way to figure out the active settings of the player building stuff, use the source's last_user
    config_player = source_entity.last_user.index
  end
  local surface = source_entity.surface
  local replicating_name = source_entity.name
  local belt_name = belt_type_mapping[source_entity.name].belt
  local underground_name = get_config(config_player, source_entity.name, "underground")
  local prefer_underground = get_config(config_player, source_entity.name, "prefer_underground")
  local direction = source_entity.direction
  for i=1,path_distance-1 do
    -- evaluate whether we can place ghost belts in each spot along the path, collect for the pathfinder
    placability[i] = can_build_in_spot(source_entity, i)
  end
  local cursor = 1
  while cursor do
    if cursor == #placability + 1 then
      -- the cursor has reached the destination block (or we didn't have any blocks to fill in the first place), we're done.
      break
    end
    if not placability[cursor] then
      -- can't make this path work since we can't place at the cursor, fail out
      break
    end
    if cursor == #placability then
      -- on the last segment of the path we needed to fill, no need to check for the validity of the following spot, just put a normal belt here
      build_plan[cursor] = build_plan_belt
      cursor = cursor + 1
    else
      if prefer_underground then
        ---- Underground Pathing ----
        -- see if we can place an underground at any distance > 1, fail to trying an overground then checking underground again
        local max_skips = underground_distances[underground_name] - 1
        if #placability - (cursor + 1) < max_skips then
           -- shorten the possible underground run if we're too close to the destination to use the whole potential length
          max_skips = #placability - (cursor + 1)
        end
        if max_skips < 1 then
          -- a successful underground run should probably end up going under something, so that won't work.
          -- make an overground belt if there's a free spot after it, otherwise just fail
          if placability[cursor+1] then
            build_plan[cursor] = build_plan_belt
            cursor = cursor + 1
          else
            break
          end
        else
          -- iterate backwards over the possible range of this underground run, looking for the furthest possible
          -- location which has an empty space in front of it for our next belt (or is the end of the path)
          local exit
          for i=cursor + max_skips + 1, cursor + 1, -1 do
            if placability[i] and (placability[i+1] == nil or placability[i+1]) then
              exit = i
              break
            end
          end
          if exit then
            -- found a valid exit, let's lay the plan for the entire run (didn't plan input above like when preferring over-ground)
            build_plan[cursor] = build_plan_input
            for i=cursor+1, exit-1 do
              build_plan[i] = build_plan_skip
            end
            build_plan[exit] = build_plan_output
            -- we've planned all those steps successfully, move the cursor up to the block after the exit
            cursor = exit + 1
          else
            if placability[cursor+1] then
              -- couldn't make an underground but there's a clear spot after the cursor, place an overground
              build_plan[cursor] = build_plan_belt
              cursor = cursor + 1
            else
              -- fail the path
              break
            end
          end
        end
      else
        ---- Standard Pathing ----
        -- at least two segments need filled still, check the next
        if not placability[cursor+1] then
          -- obstruction, we're headed underground. put an input belt here.
          build_plan[cursor] = build_plan_input
          local max_skips = underground_distances[underground_name] - 1
          if #placability - (cursor + 1) < max_skips then
            -- shorten the possible underground run if we're too close to the destination to use the whole potential length
            max_skips = #placability - (cursor + 1)
            if max_skips < 1 then
              -- a successful underground run should probably end up going under something, so let's fail
              break
            end
          end
          -- iterate backwards over the possible range of this underground run, looking for the first position that's
          -- unobstructed but just past an obstruction, and has an empty space in front of it for our next belt
          local exit
          for i=cursor + max_skips + 1, cursor + 1, -1 do
            if placability[i] and not placability[i-1] then
              -- check if the spot after the exit is either a) the end of the path we need to fill or b) a valid spot itself, 
              -- to keep the path from getting stuck having chosen a 1-wide gap to exit in
              if placability[i+1] == nil or placability[i+1] then
                exit = i
                break
              end
            end
          end
          if exit then
            -- found a valid exit, let's lay the plan for the rest of the underground run (input already planned above)
            for i=cursor+1, exit-1 do
              build_plan[i] = build_plan_skip
            end
            build_plan[exit] = build_plan_output
            -- we've planned all those steps successfully, move the cursor up to the block after the exit to go back to trying for normal belts again
            cursor = exit + 1
          else
            -- there wasn't a valid exit in range, fail the whole path
            break
          end
        else
          -- this segment and the next are clear, plan a belt here
          build_plan[cursor] = build_plan_belt
          cursor = cursor + 1
        end
      end
    end
  end

  if #build_plan == path_distance-1 then
    -- we ended up with a plan that covers the entire stretch, build it
    for i, v in ipairs(build_plan) do
      local target_position
      if direction == north then
        target_position = {source_entity.position.x, source_entity.position.y-i}
      elseif direction == south then
        target_position = {source_entity.position.x, source_entity.position.y+i}
      elseif direction == east then
        target_position = {source_entity.position.x+i, source_entity.position.y}
      elseif direction == west then
        target_position = {source_entity.position.x-i, source_entity.position.y}
      end
      local new_belt
      if player_index and game.players[player_index].cheat_mode then
        -- cheat mode, build for free
        if v == build_plan_belt then
          new_belt = surface.create_entity({
            name = belt_name,
            position = target_position,
            direction = direction,
            force = source_entity.force,
          })
        elseif v == build_plan_input then
          new_belt = surface.create_entity({
            name = underground_name,
            position = target_position,
            direction = direction,
            force = source_entity.force,
            type = "input",
          })
        elseif v == build_plan_output then
          new_belt = surface.create_entity({
            name = underground_name,
            position = target_position,
            direction = direction,
            force = source_entity.force,
            type = "output",
          })
        end
      else
        -- normal mode, make ghosts
        if v == build_plan_belt then
          new_belt = surface.create_entity({
            name = "entity-ghost",
            inner_name = belt_name,
            position = target_position,
            direction = direction,
            force = source_entity.force,
          })
        elseif v == build_plan_input then
          new_belt = surface.create_entity({
            name = "entity-ghost",
            inner_name = underground_name,
            position = target_position,
            direction = direction,
            force = source_entity.force,
            type = "input",
          })
        elseif v == build_plan_output then
          new_belt = surface.create_entity({
            name = "entity-ghost",
            inner_name = underground_name,
            position = target_position,
            direction = direction,
            force = source_entity.force,
            type = "output",
          })
        end
      end
      if new_belt then
        local event = {
          created_entity = new_belt,
        }
        if config_player then
          -- set the last_user to the player that triggered the build
          new_belt.last_user = game.players[config_player]
          -- set the event attribute for that player too
          event.player_index = config_player
        end
        script.raise_event(defines.events.script_raised_built, event)
      end
    end
    if belt_type_mapping[source_entity.name].autoconnect then
      try_autoconnect(source_entity)
    end
    if #build_plan == 0 then
      -- potentially giving a refund if we downgrade either end since this was a 0-length run
      touched_belts[source_entity] = true
      touched_belts[dest_entity] = true
    else
      touched_belts[source_entity] = false
      touched_belts[dest_entity] = false
    end
  end
  -- clear these tables out for use next time
  for k in pairs(build_plan) do
    build_plan[k] = nil
  end
  for k in pairs(placability) do
    placability[k] = nil
  end
end
local function trigger_downgrade(entity, refund, player_index)
  local surface = entity.surface
  local replicating_belt_name = entity.name
  local belt_name = belt_type_mapping[entity.name].belt
  local position = entity.position
  local direction = entity.direction
  local force = entity.force
  local new_belt = surface.create_entity({
    name = belt_name,
    position = position,
    direction = direction,
    force = force,
    fast_replace = true,
    spill = false,
  })
  if player_index then
    local player = game.players[player_index]
    new_belt.last_user = player
    if refund and player.get_item_count(belt_name) > 0 then
      player.insert({
        name = replicating_belt_name,
        count = player.remove_item({
          name = belt_name,
          count = 1,
        })
      })
    end
  end
end
local function check_downgrade(entity, refund, player_index)
  local downgrade = false
  if entity.type == "entity-ghost" then
    return
  end
  if not can_build_in_spot(entity, 1) then
    for _, v in pairs(scan_directions[entity.direction]) do
      local neighbors = get_neighbor_entities(entity, v)
      for _, neighbor in pairs(neighbors) do
        if facing_toward_the_scanner_filters[v][neighbor.direction] then
          local neighbortype
          if neighbor.type == "entity-ghost" then
            neighbortype = neighbor.ghost_type
          else
            neighbortype = neighbor.type
          end
          if neighbortype == "transport-belt" or neighbortype == "splitter" or (neighbortype == "underground-belt" and neighbor.belt_to_ground_type == "output") or (neighbortype == "loader" and neighbor.loader_type == "output") then
            downgrade = true
          end
        end
      end
    end
    if downgrade then
      trigger_downgrade(entity, refund, player_index)
    end
  end
end

local function check_direction(entity, search_direction, direction_filter, player_index, include_ghosts)
  local name
  if entity.type == "transport-belt" then
    name = entity.name
  else
    name = entity.ghost_name
  end
  -- construct the area to search
  local area
  if search_direction == north then
    -- top left - top left of current plus max north
    -- bot right - top right of current
    area = {{entity.position.x-0.5, entity.position.y-(scan_max_distance+0.5)}, {entity.position.x+0.5, entity.position.y-0.5}}
  elseif search_direction == south then
    -- top left - bot left of current
    -- bot right - bot right of current plus max south
    area = {{entity.position.x-0.5, entity.position.y+0.5}, {entity.position.x+0.5, entity.position.y+(scan_max_distance+0.5)}}
  elseif search_direction == west then
    -- top left - top left of current plus max west
    -- bot right - bot left of current
    area = {{entity.position.x-(scan_max_distance+0.5), entity.position.y-0.5}, {entity.position.x-0.5, entity.position.y+0.5}}
  elseif search_direction == east then
    -- top left - top right of current
    -- bot right - bot right of current plus max east
    area = {{entity.position.x+0.5, entity.position.y-0.5}, {entity.position.x+(scan_max_distance+0.5), entity.position.y+0.5}}
  end
  -- search!
  local closest_facing
  local closest_distance
  -- look for already-built peers
  local entities = game.surfaces[entity.surface.index].find_entities_filtered({
    area = area,
    name = name,
    force = entity.force,
  })
  for k,v in pairs(entities) do
    if direction_filter[v.direction] and not v.to_be_deconstructed(v.force) then
      -- this one's facing in a direction we're interested in, let's check whether it's the closest one we've seen
      local match_distance
      if search_direction == north or search_direction == south then
        match_distance = math.abs(v.position.y - entity.position.y)
      elseif search_direction == east or search_direction == west then
        match_distance = math.abs(v.position.x - entity.position.x)
      end
      -- check whether this is the closest one we've found
      if match_distance then
        if closest_distance == nil or match_distance < closest_distance then
          closest_facing = v
          closest_distance = match_distance
        end
      end
    end
  end
  if include_ghosts then
    -- Also check ghost entities in the target area since we're running a scan that can match with a ghost
    local entities = game.surfaces[entity.surface.index].find_entities_filtered({
      area = area,
      ghost_name = name,
      force = entity.force,
    })
    for k,v in pairs(entities) do
      if direction_filter[v.direction] then
        -- this one's facing in a direction we're interested in, let's check whether it's the closest one we've seen
        local match_distance
        if search_direction == north or search_direction == south then
          match_distance = math.abs(v.position.y - entity.position.y)
        elseif search_direction == east or search_direction == west then
          match_distance = math.abs(v.position.x - entity.position.x)
        end
        -- check whether this is the closest one we've found
        if match_distance then
          if closest_distance == nil or match_distance < closest_distance then
            closest_facing = v
            closest_distance = match_distance
          end
        end
      end
    end
  end
  if closest_distance then
    local source_entity
    local dest_entity
    if direction_filter[search_direction] then
      -- we're filtering the same way we're searching, so we're pointing toward the match we found
      source_entity = entity
      dest_entity = closest_facing
    else
      -- match is pointing toward us
      source_entity = closest_facing
      dest_entity = entity
    end
    -- we found a peer that aligns, so call the function that does the heavy lifting on planning the ghosts
    check_path(source_entity, dest_entity, closest_distance, player_index)
  end
end

local function scan_from_entity(entity, player_index)
  if entity.to_be_deconstructed(entity.force) then
    -- don't trigger from deconstructing entities
    return
  end
  for _, v in pairs(scan_directions[entity.direction]) do
    -- scan in the three directions a matching belt might be facing us in
    check_direction(entity, v, facing_toward_the_scanner_filters[v], player_index, false)
  end
  if entity.type == "transport-belt" then
    -- not a ghost. check if there's an obstruction directly ahead. if so, downconvert
    -- (and try to refund a replicating belt to the player at the cost of a normal belt, since we didn't do anything too useful)

    -- if we're an autoconnecting type, check for neighbors to link to
    if belt_type_mapping[entity.name].autoconnect then
      try_autoconnect(entity)
    end
    if not can_build_in_spot(entity, 1) then
      -- mark for potential refund
      touched_belts[entity] = true
    else
      touched_belts[entity] = false
    end
    check_direction(entity, entity.direction, facing_any_but_opposite_filters[entity.direction], player_index, true)
  end
  for entity, refund in pairs(touched_belts) do
    check_downgrade(entity, refund, player_index)
  end
  for k in pairs(touched_belts) do
    touched_belts[k] = nil
  end
end

local function open_gui(event)
  local player = game.players[event.player_index]
  -- create parent frame
  local settings = player.gui.center.add({
    type = "frame",
    name = "replicating_belts_config",
    direction = "vertical",
  })
  -- vertical flow for all options
  local config_flow = settings.add({
    type = "flow",
    direction = "vertical",
    name = "replicating_belts_config_flow",
  })
  -- horizontal flow for the choose-elem buttons
  local button_flow = config_flow.add({
    type = "flow",
    direction = "horizontal",
    name = "replicating_belts_config_buttons",
  })
  -- locked button displaying belt type (todo, would be nice to find a way to make this look non-interactive)
  local belt_button = button_flow.add({
    type = "choose-elem-button",
    name = "replicating_belts_config_belt_button",
    style = "slot_button",
    elem_type = "item",
    tooltip = {"replicating-belts.config-current-belt-type"},
  })
  belt_button.elem_value = event.item.name
  belt_button.locked = true
  -- button for changing which underground belt is used (todo, would be nice to somehow be able to filter this down to showing just items that create an underground-belt entity)
  local underground_button = button_flow.add({
    type = "choose-elem-button",
    name = "replicating_belts_config_underground_button",
    style = "slot_button",
    elem_type = "item",
    item = belt_type_mapping[event.item.name].underground,
    tooltip = {"replicating-belts.config-underground-belt-to-place"},
  })
  underground_button.elem_value = get_config(event.player_index, event.item.name, "underground")

  -- checkbox for setting the pathing strategy to prefer underground
  local mode_checkbox = config_flow.add({
    type = "checkbox",
    name = "replicating_belts_config_mode_toggle",
    state = get_config(event.player_index, event.item.name, "prefer_underground"),
    caption = {"replicating-belts.config-prefer-underground"},
  })

  -- set the player's current opened gui to the frame
  player.opened = settings
end

local function on_built_entity(event)
  if event.created_entity.type == "entity-ghost" then
    if belt_type_mapping[event.created_entity.ghost_name] then
      scan_from_entity(event.created_entity, event.player_index)
    end
  else
    if belt_type_mapping[event.created_entity.name] then
      scan_from_entity(event.created_entity, event.player_index)
    end
  end
end
script.on_event(defines.events.on_built_entity, on_built_entity)

local function on_robot_built_entity(event)
  if belt_type_mapping[event.created_entity.name] then
    scan_from_entity(event.created_entity)
  end
end
script.on_event(defines.events.on_robot_built_entity, on_robot_built_entity)

local function on_player_rotated_entity(event)
  if belt_type_mapping[event.entity.name] then
    event.entity.direction = event.previous_direction
    trigger_downgrade(event.entity, true, event.player_index)
  end
end
script.on_event(defines.events.on_player_rotated_entity, on_player_rotated_entity)

local function on_mod_item_opened(event)
  if belt_type_mapping[event.item.name] then
    open_gui(event)
  end
end
script.on_event(defines.events.on_mod_item_opened, on_mod_item_opened)

local function on_gui_elem_changed(event)
  if event.element.name == "replicating_belts_config_underground_button" then
    local player_index = event.player_index
    local underground = event.element.elem_value
    local button_flow = event.element.parent
    local belt = button_flow.replicating_belts_config_belt_button.elem_value

    if underground == nil or game.entity_prototypes[underground].type ~= "underground-belt" then
      -- not an underground belt, revert to default
      underground = belt_type_mapping[belt].underground
      event.element.elem_value = belt_type_mapping[belt].underground
    end
    if game.entity_prototypes[underground].has_flag("not-blueprintable") then
      -- ಠ_ಠ
      game.players[player_index].print("Can't use selected underground belt, its mod author has flagged it as not-blueprintable")
      underground = belt_type_mapping[belt].underground
      event.element.elem_value = belt_type_mapping[belt].underground
    end
    if not global.rbconfig then
      global.rbconfig = {}
    end
    if not global.rbconfig[player_index] then
      global.rbconfig[player_index] = {}
    end
    if not global.rbconfig[player_index][belt] then
      global.rbconfig[player_index][belt] = {}
    end
    global.rbconfig[player_index][belt].underground = underground
  end
end
script.on_event(defines.events.on_gui_elem_changed, on_gui_elem_changed)

local function on_gui_checked_state_changed(event)
  if event.element.name == "replicating_belts_config_mode_toggle" then
    local player_index = event.player_index
    local parent_flow = event.element.parent
    local belt = parent_flow.replicating_belts_config_buttons.replicating_belts_config_belt_button.elem_value
    if not global.rbconfig then
      global.rbconfig = {}
    end
    if not global.rbconfig[player_index] then
      global.rbconfig[player_index] = {}
    end
    if not global.rbconfig[player_index][belt] then
      global.rbconfig[player_index][belt] = {}
    end
    global.rbconfig[player_index][belt].prefer_underground = event.element.state
  end
end
script.on_event(defines.events.on_gui_checked_state_changed, on_gui_checked_state_changed)

local function on_gui_closed(event)
  if event.element and event.element.name == "replicating_belts_config" then
    event.element.destroy()
  end
end
script.on_event(defines.events.on_gui_closed, on_gui_closed)
