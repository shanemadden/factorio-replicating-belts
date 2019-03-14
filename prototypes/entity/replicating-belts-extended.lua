require "util"
require "shared"

local entity_mapping = {
  -- blistering
  ["replicating-blistering-transport-belt"] = {
    copy = "blistering-transport-belt",
    icon = "__replicating-belts__/graphics/icons/extended/replicating-blistering-transport-belt.png",
    tint = {r=10,g=225,b=25},
  },
  -- furious
  ["replicating-furious-transport-belt"] = {
    copy = "furious-transport-belt",
    icon = "__replicating-belts__/graphics/icons/extended/replicating-furious-transport-belt.png",
    tint = {r=165,g=10,b=225},
  },
}
for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
