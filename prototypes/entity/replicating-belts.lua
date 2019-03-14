require "util"
require "shared"

local entity_mapping = {
  -- yellow
  ["replicating-transport-belt"] = {
    copy = "transport-belt",
    icon = "__replicating-belts__/graphics/icons/replicating-transport-belt.png",
    tint = {r=225, g=165, b=10},
  },
  -- red
  ["replicating-fast-transport-belt"] = {
    copy = "fast-transport-belt",
    icon = "__replicating-belts__/graphics/icons/replicating-fast-transport-belt.png",
    tint = {r=225, g=10, b=10},
  },
  -- blue
  ["replicating-express-transport-belt"] = {
    copy = "express-transport-belt",
    icon = "__replicating-belts__/graphics/icons/replicating-express-transport-belt.png",
    tint = {r=10, g=165, b=225},
  },
}
for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
