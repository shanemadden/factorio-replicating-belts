local replicating_ultra_fast_belt = {
  type = "recipe",
  name = "replicating-ultra-fast-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultra-fast-belt-lower"}},
  enabled = false,
  ingredients ={
    {'ultra-fast-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-ultra-fast-belt",
}

local replicating_extreme_fast_belt = {
  type = "recipe",
  name = "replicating-extreme-fast-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.extreme-fast-belt-lower"}},
  enabled = false,
  ingredients = {
    {'extreme-fast-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-extreme-fast-belt",
}

local replicating_ultra_express_belt = {
  type = "recipe",
  name = "replicating-ultra-express-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultra-express-belt-lower"}},
  enabled = false,
  ingredients = {
    {'ultra-express-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-ultra-express-belt",
}

local replicating_extreme_express_belt = {
  type = "recipe",
  name = "replicating-extreme-express-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.extreme-express-belt-lower"}},
  enabled = false,
  ingredients = {
    {'extreme-express-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-extreme-express-belt",
}

local replicating_ultimate_transport_belt = {
  type = "recipe",
  name = "replicating-ultimate-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultimate-belt-lower"}},
  enabled = false,
  ingredients = {
    {'ultimate-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-ultimate-transport-belt",
}

data:extend{replicating_ultra_fast_belt, replicating_extreme_fast_belt, replicating_ultra_express_belt, replicating_extreme_express_belt, replicating_ultimate_transport_belt}
