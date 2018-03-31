local replicating_turbo_transport_belt = {
  type = "recipe",
  name = "replicating-turbo-transport-belt",
  enabled = false,
  ingredients = {
    {'turbo-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-turbo-transport-belt",
}

local replicating_ultrabob_transport_belt = {
  type = "recipe",
  name = "replicating-ultrabob-transport-belt",
  enabled = false,
  ingredients = {
    {'ultimate-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-ultrabob-transport-belt",
}


data:extend{replicating_turbo_transport_belt, replicating_ultrabob_transport_belt}
