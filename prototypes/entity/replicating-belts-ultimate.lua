require "util"
require "shared"

local entity_mapping = {
  -- t1
  ["replicating-ultra-fast-belt"] = {
    copy = "ultra-fast-belt",
    icon = "__replicating-belts__/graphics/icons/ultimate/replicating-ultra-fast-belt.png",
    icon_size = 32,
    tint = {r=0,g=211,b=37},
  },
  -- t2
  ["replicating-extreme-fast-belt"] = {
    copy = "extreme-fast-belt",
    icon = "__replicating-belts__/graphics/icons/ultimate/replicating-extreme-fast-belt.png",
    icon_size = 32,
    tint = {r=245,g=17,b=24},
  },
  -- t3
  ["replicating-ultra-express-belt"] = {
    copy = "ultra-express-belt",
    icon = "__replicating-belts__/graphics/icons/ultimate/replicating-ultra-express-belt.png",
    icon_size = 32,
    tint = {r=86,g=0,b=204},
  },
  -- t4
  ["replicating-extreme-express-belt"] = {
    copy = "extreme-express-belt",
    icon = "__replicating-belts__/graphics/icons/ultimate/replicating-extreme-express-belt.png",
    icon_size = 32,
    tint = {r=0,g=0,b=204},
  },
  -- t5
  ["replicating-ultimate-transport-belt"] = {
    copy = "ultimate-belt",
    icon = "__replicating-belts__/graphics/icons/ultimate/replicating-ultimate-transport-belt.png",
    icon_size = 32,
    tint = {r=0,g=230,b=204},
  },
}

for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
