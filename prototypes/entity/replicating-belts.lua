require "util"

-- this is a special belt to collide with ghosts, so that the obstruction finder will include existing ghosts and avoid plowing over them
local collision_belt = table.deepcopy(data.raw["transport-belt"]["transport-belt"])
collision_belt.name = "ghost-collision-test-belt"
collision_belt.order = "z"
collision_belt.collision_mask = {"object-layer", "water-tile", "ghost-layer"}

local entities = { collision_belt }

-- all of the attributes we'll iterate on the copied to replace the sprites with the tinted versions
local attributes_with_filenames = {
  "animations",
  "belt_horizontal",
  "belt_vertical",
  "ending_top",
  "ending_bottom",
  "ending_side",
  "starting_top",
  "starting_bottom",
  "starting_side",
}

local entity_mapping = {
  -- yellow
  ["replicating-transport-belt"] = {
    copy = "transport-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/replicating-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/hr-replicating-transport-belt.png",
  },
  -- red
  ["replicating-fast-transport-belt"] = {
    copy = "fast-transport-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/replicating-fast-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/hr-replicating-fast-transport-belt.png",
  },
  -- blue
  ["replicating-express-transport-belt"] = {
    copy = "express-transport-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/replicating-express-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/hr-replicating-express-transport-belt.png",
  },
}
local belts = data.raw["transport-belt"]
for k, v in pairs(entity_mapping) do
  local entity = table.deepcopy(belts[v.copy])
  -- set the name and mining result to the replicating belt type
  entity.name = k
  entity.minable.result = k
  -- iterate the sprites and point to the tinted file
  for _, attribute in ipairs(attributes_with_filenames) do
    if entity[attribute].filename then
      entity[attribute].filename = v.filename
    end
    -- and high res
    if entity[attribute].hr_version and entity[attribute].hr_version.filename then
      entity[attribute].hr_version.filename = v.hr_file
    end
  end
  table.insert(entities, entity)
end

data:extend(entities)
