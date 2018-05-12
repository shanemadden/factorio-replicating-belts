local replicating_rapid_mk1 = {
  type = "recipe",
  name = "replicating-rapid-transport-belt-mk1",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.rapid-transport-belt-mk1-lower"}},
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
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.rapid-transport-belt-mk2-lower"}},
  enabled = false,
  ingredients = {
    {'rapid-transport-belt-mk2', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-rapid-transport-belt-mk2",
}

data:extend{replicating_rapid_mk1, replicating_rapid_mk2}
