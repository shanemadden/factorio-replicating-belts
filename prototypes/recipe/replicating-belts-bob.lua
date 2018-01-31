local replicating_green_transport_belt = {
  type = "recipe",
  name = "replicating-green-transport-belt",
  enabled = false,
  ingredients = {
    {'green-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-green-transport-belt",
}

local replicating_purple_transport_belt = {
  type = "recipe",
  name = "replicating-purple-transport-belt",
  enabled = false,
  ingredients = {
    {'purple-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-purple-transport-belt",
}

data:extend{replicating_green_transport_belt, replicating_purple_transport_belt}
