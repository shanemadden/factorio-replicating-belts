require "util"
require "shared"

if mods["Krastorio2"] then
  local entity_mapping = {
    -- advanced
    ["replicating-kr-advanced-transport-belt"] = {
      copy = "kr-advanced-transport-belt",
      icon = "__replicating-belts__/graphics/icons/krastorio2/replicating-kr-advanced-transport-belt.png",
      icon_size = 32,
      tint = {r=10,g=225,b=25},
    },
    -- superior
    ["replicating-kr-superior-transport-belt"] = {
      copy = "kr-superior-transport-belt",
      icon = "__replicating-belts__/graphics/icons/krastorio2/replicating-kr-superior-transport-belt.png",
      icon_size = 32,
      tint = {r=165,g=10,b=225},
    },
  }
  for k, v in pairs(entity_mapping) do
    replicating_belts.entity(k, v)
  end
end
