local replicating_rapid_mk1 = {
  type = "recipe",
  name = "replicating-rapid-transport-belt-mk1",
  enabled = false,
  ingredients = {
    {'rapid-transport-belt-mk1', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-rapid-transport-belt-mk1",
}

local replicating_rapid_mk2 = {
  type = "recipe",
  name = "replicating-rapid-transport-belt-mk2",
  enabled = false,
  ingredients = {
    {'rapid-transport-belt-mk2', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-rapid-transport-belt-mk2",
}

data:extend{replicating_rapid_mk1, replicating_rapid_mk2}
