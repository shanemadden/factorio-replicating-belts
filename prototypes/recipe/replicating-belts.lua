local replicating_transport_belt = {
  type = "recipe",
  name = "replicating-transport-belt",
  enabled = false,
  ingredients = {
    {'transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-transport-belt",
}

local replicating_fast_transport_belt = {
  type = "recipe",
  name = "replicating-fast-transport-belt",
  enabled = false,
  ingredients = {
    {'fast-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-fast-transport-belt",
}

local replicating_express_transport_belt = {
  type = "recipe",
  name = "replicating-express-transport-belt",
  enabled = false,
  ingredients = {
    {'express-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-express-transport-belt",
}

data:extend{replicating_transport_belt, replicating_fast_transport_belt, replicating_express_transport_belt}
