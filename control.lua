-- tint for ulti, new tech graphic
-- todo config dialog to set which underground used, override max distance, set prefer udnerground path
-- persist those settings keyed on the replicating item - so each belt type's setting will stick for the player
-- todo deactivate when not-our-belt is placed right in front of us
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
  -- bob's green
  ["replicating-green-transport-belt"] = {
    belt = "green-transport-belt",
    underground = "green-underground-belt",
  },
  -- bob's purple
  ["replicating-purple-transport-belt"] = {
    belt = "purple-transport-belt",
    underground = "purple-underground-belt",
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
    belt = "ultimate-transport-belt",
    underground = "ultimate-underground-belt",
  },
}

do
  -- we need to know each underground belt type's max distance but we can't query the game object 
  -- during loading for the value from the prototype (and many mods change these values, so we can't hardcode stock)
  -- work around this by waiting until the max_distance key gets read the first time for each belt type, then populate it
  local distance_lookup_metatable = {
    __index = function(table, key)
      local raw = rawget(table, key)
      if key == "max_distance" then
        -- we haven't read for this belt type before, get the data
        local underground = rawget(table, "underground")
        local distance = game.entity_prototypes[underground].max_underground_distance
        -- store it so we won't get called again
        table.max_distance = distance
        return distance
      else
        if raw then
          table[key] = raw
          return raw
        else
          -- prevent repeat calls if we leave it nil
          table[key] = false
          return false
        end
      end
    end
  }
  -- attach the metatable to each belt type in the mapping table
  for k, v in pairs(belt_type_mapping) do
    belt_type_mapping[k] = setmetatable(v, distance_lookup_metatable)
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
local function check_path(source_entity, dest_entity, path_distance, player_index)
  local surface = source_entity.surface
  local replicating_name = source_entity.name
  local belt_name = belt_type_mapping[source_entity.name].belt
  local underground_name = belt_type_mapping[source_entity.name].underground
  local direction = source_entity.direction
  for i=1,path_distance-1 do
    -- evaluate whether we can place our special belt entity (which collides with ghosts) in each spot along the path, collect for the pathfinder
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
      -- at least two segments need filled still, check the next
      if not placability[cursor+1] then
        -- obstruction, we're headed underground. put an input belt here.
        build_plan[cursor] = build_plan_input
        local max_skips = belt_type_mapping[source_entity.name].max_distance - 1
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
      if v == build_plan_belt then
        surface.create_entity({
          name = "entity-ghost",
          inner_name = belt_name,
          position = target_position,
          direction = direction,
          force = source_entity.force,
        })
      elseif v == build_plan_input then
        surface.create_entity({
          name = "entity-ghost",
          inner_name = underground_name,
          position = target_position,
          direction = direction,
          force = source_entity.force,
          type = "input",
        })
      elseif v == build_plan_output then
        surface.create_entity({
          name = "entity-ghost",
          inner_name = underground_name,
          position = target_position,
          direction = direction,
          force = source_entity.force,
          type = "output",
        })
      end
    end
    if belt_type_mapping[source_entity.name].autoconnect then
      try_autoconnect(source_entity)
    end
    -- delete the replicating belt and convert down to a regular belt
    local target_position = source_entity.position
    surface.create_entity({
      name = belt_name,
      position = target_position,
      direction = direction,
      force = dest_entity.force,
      fast_replace = true,
      spill = false,
    })
    if #build_plan == 0 then
      -- we built a 0-length run, see if we can give the player a replicating belt back at the cost of a normal belt
      if player_index then
        local player = game.players[player_index]
        if player.get_item_count(belt_name) > 0 then
          player.insert({
            name = replicating_name,
            count = player.remove_item({
              name = belt_name,
              count = 1,
            })
          })
        end
      end
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
      local surface = entity.surface
      local replicating_belt_name = entity.name
      local belt_name = belt_type_mapping[entity.name].belt
      local position = entity.position
      local direction = entity.direction
      local force = entity.force
      surface.create_entity({
        name = belt_name,
        position = position,
        direction = direction,
        force = force,
        fast_replace = true,
        spill = false,
      })
      if player_index then
        -- a player triggered this, try to refund them (bots are out of luck)
        local player = game.players[player_index]
        if player.get_item_count(belt_name) > 0 then
          player.insert({
            name = replicating_belt_name,
            count = player.remove_item({
              name = belt_name,
              count = 1,
            })
          })
        end
      end
    else
      -- no obstruction directly forward, so let's check if we can build from here forward too
      check_direction(entity, entity.direction, facing_any_but_opposite_filters[entity.direction], player_index, true)
    end
  end
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
    scan_from_entity(event.entity, event.player_index)
  end
end
script.on_event(defines.events.on_player_rotated_entity, on_player_rotated_entity)
