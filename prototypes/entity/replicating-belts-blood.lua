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
  -- yellow blood
  ["replicating-blood-belt"] = {
    copy = "blood-belt",
    icon = "__replicating-belts__/graphics/icons/blood/replicating-blood-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/blood/replicating-blood-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/blood/hr-replicating-blood-belt.png",
  },
  -- red blood
  ["replicating-fast-blood-belt"] = {
    copy = "blood-belt-fast",
    icon = "__replicating-belts__/graphics/icons/blood/replicating-fast-blood-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/blood/replicating-fast-blood-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/blood/hr-replicating-fast-blood-belt.png",
  },
  -- blue blood
  ["replicating-express-blood-belt"] = {
    copy = "blood-belt-express",
    icon = "__replicating-belts__/graphics/icons/blood/replicating-express-blood-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/blood/replicating-express-blood-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/blood/hr-replicating-express-blood-belt.png",
  },
}
local belts = data.raw["transport-belt"]
for k, v in pairs(entity_mapping) do
  local entity = table.deepcopy(belts[v.copy])
  -- set the name and mining result to the replicating belt type
  entity.name = k
  entity.minable.result = k
  entity.icon = v.icon
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
