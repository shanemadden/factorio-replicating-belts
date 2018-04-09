require "util"

local entities = {}

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
  -- mk1
  ["replicating-rapid-transport-belt-mk1"] = {
    copy = "rapid-transport-belt-mk1",
    filename = "__replicating-belts__/graphics/entity/transport-belt/bob/replicating-green-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/bob/hr-replicating-green-transport-belt.png",
  },
  -- mk2
  ["replicating-rapid-transport-belt-mk2"] = {
    copy = "rapid-transport-belt-mk2",
    filename = "__replicating-belts__/graphics/entity/transport-belt/bob/replicating-purple-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/bob/hr-replicating-purple-transport-belt.png",
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
