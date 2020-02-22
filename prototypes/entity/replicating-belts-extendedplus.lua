require "util"
require "shared"

local entity_mapping = {
  -- mk1
  ["replicating-rapid-transport-belt-mk1"] = {
    copy = "rapid-transport-belt-mk1",
    icon = "__replicating-belts__/graphics/icons/bob/replicating-green-transport-belt.png",
    icon_size = 32,
    tint = {r=10,g=225,b=25},
  },
  -- mk2
  ["replicating-rapid-transport-belt-mk2"] = {
    copy = "rapid-transport-belt-mk2",
    icon = "__replicating-belts__/graphics/icons/bob/replicating-purple-transport-belt.png",
    icon_size = 32,
    tint = {r=165,g=10,b=225},
  },
}
for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
