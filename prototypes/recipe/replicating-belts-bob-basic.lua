local replicating_basic_transport_belt = {
  type = "recipe",
  name = "replicating-basic-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.basic-transport-belt-lower"}},
  enabled = false,
  ingredients = {
    {'basic-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-basic-transport-belt",
}

data:extend{replicating_basic_transport_belt}
