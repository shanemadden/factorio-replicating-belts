require "util"
require "shared"

local entity_mapping = {
  -- purple / turbo
  ["replicating-turbo-transport-belt"] = {
    copy = "turbo-transport-belt",
    icon = "__replicating-belts__/graphics/icons/bob/replicating-purple-transport-belt.png",
    icon_size = 32,
    tint = {r=165,g=10,b=225},
  },
  -- green / ultimate
  ["replicating-ultrabob-transport-belt"] = {
    copy = "ultimate-transport-belt",
    icon = "__replicating-belts__/graphics/icons/bob/replicating-green-transport-belt.png",
    icon_size = 32,
    tint = {r=10,g=225,b=25},
  },
}
for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
