require "util"
require "shared"

if data.raw.item["5d-mk5-transport-belt"] then
  local entity_mapping = {
    -- mk4
    ["replicating-5d-mk4-transport-belt"] = {
      copy = "5d-mk4-transport-belt",
      icon = "__replicating-belts__/graphics/icons/5dim/replicating-5d-mk4-transport-belt.png",
      icon_size = 32,
      tint = {r=10,g=225,b=25},
    },
    -- mk5
    ["replicating-5d-mk5-transport-belt"] = {
      copy = "5d-mk5-transport-belt",
      icon = "__replicating-belts__/graphics/icons/5dim/replicating-5d-mk5-transport-belt.png",
      icon_size = 32,
    },
  }
  for k, v in pairs(entity_mapping) do
    replicating_belts.entity(k, v)
  end
end
