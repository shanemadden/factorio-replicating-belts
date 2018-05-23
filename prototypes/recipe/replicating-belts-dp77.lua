local replicating_swift_transport_belt = {
  type = "recipe",
  name = "replicating-swift-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.swift-transport-belt-lower"}},
  enabled = false,
  ingredients ={
    {'swift-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-swift-transport-belt",
}

local replicating_elite_transport_belt = {
  type = "recipe",
  name = "replicating-elite-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.elite-transport-belt-lower"}},
  enabled = false,
  ingredients = {
    {'elite-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-elite-transport-belt",
}

local replicating_sonic_transport_belt = {
  type = "recipe",
  name = "replicating-sonic-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.sonic-transport-belt-lower"}},
  enabled = false,
  ingredients = {
    {'sonic-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-sonic-transport-belt",
}

local replicating_hyper_transport_belt = {
  type = "recipe",
  name = "replicating-hyper-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.hyper-transport-belt-lower"}},
  enabled = false,
  ingredients = {
    {'hyper-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-hyper-transport-belt",
}

local replicating_stealt_transport_belt = {
  type = "recipe",
  name = "replicating-stealt-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.stealt-transport-belt-lower"}},
  enabled = false,
  ingredients = {
    {'stealt-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-stealt-transport-belt",
}


local replicating_giga_transport_belt = {
  type = "recipe",
  name = "replicating-giga-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.giga-transport-belt-lower"}},
  enabled = false,
  ingredients = {
    {'giga-transport-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-giga-transport-belt",
}

data:extend{replicating_swift_transport_belt, replicating_elite_transport_belt, replicating_sonic_transport_belt, replicating_hyper_transport_belt, replicating_stealt_transport_belt, replicating_giga_transport_belt}
