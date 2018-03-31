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
  -- t1
  ["replicating-ultra-fast-belt"] = {
    copy = "ultra-fast-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/ultimate/replicating-ultra-fast-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/ultimate/hr-replicating-ultra-fast-belt.png",
  },
  -- t2
  ["replicating-extreme-fast-belt"] = {
    copy = "extreme-fast-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/ultimate/replicating-extreme-fast-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/ultimate/hr-replicating-extreme-fast-belt.png",
  },
  -- t3
  ["replicating-ultra-express-belt"] = {
    copy = "ultra-express-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/ultimate/replicating-ultra-express-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/ultimate/hr-replicating-ultra-express-belt.png",
  },
  -- t4
  ["replicating-extreme-express-belt"] = {
    copy = "extreme-express-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/ultimate/replicating-extreme-express-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/ultimate/hr-replicating-extreme-express-belt.png",
  },
  -- t5
  ["replicating-ultimate-transport-belt"] = {
    copy = "ultimate-transport-belt",
    filename = "__replicating-belts__/graphics/entity/transport-belt/ultimate/replicating-ultimate-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/ultimate/hr-replicating-ultimate-transport-belt.png",
  },
}

-- ugly hack to avoid crashing when both bob's and ultimate are loaded while bob's entities are
-- overwriting ultimates since their sprite sheets have different frame counts, sigh..
if data.raw["transport-belt"]["ultimate-transport-belt"].icon == "__boblogistics__/graphics/icons/green-transport-belt.png" then
  entity_mapping["replicating-ultimate-transport-belt"].filename = "__replicating-belts__/graphics/entity/transport-belt/bob/replicating-green-transport-belt.png"
  entity_mapping["replicating-ultimate-transport-belt"].hr_file = "__replicating-belts__/graphics/entity/transport-belt/bob/hr-replicating-green-transport-belt.png"
end

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
