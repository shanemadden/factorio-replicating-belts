require "util"
require "shared"

local entity_mapping = {
  -- grey / basic
  ["replicating-basic-transport-belt"] = {
    copy = "basic-transport-belt",
    icon = "__replicating-belts__/graphics/icons/bob/replicating-grey-transport-belt.png",
    tint = {r=120,g=120,b=120},
  },
}
for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
