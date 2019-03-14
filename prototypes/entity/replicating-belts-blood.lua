require "util"
require "shared"

local entity_mapping = {
  -- yellow blood
  ["replicating-blood-belt"] = {
    copy = "blood-belt",
    icon = "__replicating-belts__/graphics/icons/blood/replicating-blood-belt.png",
  },
  -- red blood
  ["replicating-fast-blood-belt"] = {
    copy = "blood-belt-fast",
    icon = "__replicating-belts__/graphics/icons/blood/replicating-fast-blood-belt.png",
  },
  -- blue blood
  ["replicating-express-blood-belt"] = {
    copy = "blood-belt-express",
    icon = "__replicating-belts__/graphics/icons/blood/replicating-express-blood-belt.png",
  },
}
for k, v in pairs(entity_mapping) do
  replicating_belts.entity(k, v)
end
