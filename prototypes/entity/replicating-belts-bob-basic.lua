require "util"
require "shared"

if data.raw.item["basic-transport-belt"] then
  local entity_mapping = {
    -- grey / basic
    ["replicating-basic-transport-belt"] = {
      copy = "basic-transport-belt",
      icon = "__replicating-belts__/graphics/icons/bob/replicating-grey-transport-belt.png",
      icon_size = 32,
      tint = {r=120,g=120,b=120},
    },
  }
  for k, v in pairs(entity_mapping) do
    replicating_belts.entity(k, v)
  end
end
