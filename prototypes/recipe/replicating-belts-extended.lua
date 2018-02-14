local replicating_blistering_transport_belt = {
  type = "recipe",
  name = "replicating-blistering-transport-belt",
  enabled = false,
  ingredients = {
    {'blistering-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-blistering-transport-belt",
}

local replicating_furious_transport_belt = {
  type = "recipe",
  name = "replicating-furious-transport-belt",
  enabled = false,
  ingredients = {
    {'furious-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-furious-transport-belt",
}

data:extend{replicating_blistering_transport_belt, replicating_furious_transport_belt}
