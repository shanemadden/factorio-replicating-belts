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
  ["replicating-swift-transport-belt"] = {
    copy = "swift-transport-belt",
    icon = "__replicating-belts__/graphics/icons/dp77/replicating-swift-transport-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/dp77/replicating-swift-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/dp77/hr-replicating-swift-transport-belt.png",
  },
  -- t2
  ["replicating-elite-transport-belt"] = {
    copy = "elite-transport-belt",
    icon = "__replicating-belts__/graphics/icons/dp77/replicating-elite-transport-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/dp77/replicating-elite-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/dp77/hr-replicating-elite-transport-belt.png",
  },
  -- t3
  ["replicating-sonic-transport-belt"] = {
    copy = "sonic-transport-belt",
    icon = "__replicating-belts__/graphics/icons/dp77/replicating-sonic-transport-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/dp77/replicating-sonic-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/dp77/hr-replicating-sonic-transport-belt.png",
  },
  -- t4
  ["replicating-hyper-transport-belt"] = {
    copy = "hyper-transport-belt",
    icon = "__replicating-belts__/graphics/icons/dp77/replicating-hyper-transport-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/dp77/replicating-hyper-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/dp77/hr-replicating-hyper-transport-belt.png",
  },
  -- t5
  ["replicating-stealt-transport-belt"] = {
    copy = "stealt-transport-belt",
    icon = "__replicating-belts__/graphics/icons/dp77/replicating-stealt-transport-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/dp77/replicating-stealt-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/dp77/hr-replicating-stealt-transport-belt.png",
  },
  -- t6
  ["replicating-giga-transport-belt"] = {
    copy = "giga-transport-belt",
    icon = "__replicating-belts__/graphics/icons/dp77/replicating-giga-transport-belt.png",
    filename = "__replicating-belts__/graphics/entity/transport-belt/dp77/replicating-giga-transport-belt.png",
    hr_file = "__replicating-belts__/graphics/entity/transport-belt/dp77/hr-replicating-giga-transport-belt.png",
  },
}

local belts = data.raw["transport-belt"]
for k, v in pairs(entity_mapping) do
  local entity = table.deepcopy(belts[v.copy])
  -- set the name and mining result to the replicating belt type
  entity.name = k
  entity.minable.result = k
  entity.icon = v.icon
  entity.localised_name = {"replicating-belts.prefix", {[1] = string.format("replicating-belts.%s-lower", v.copy)}}
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
