local replicating_blood_belt = {
  type = "recipe",
  name = "replicating-blood-belt",
  enabled = false,
  ingredients = {
    {'blood-belt', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-blood-belt",
}

local replicating_fast_blood_belt = {
  type = "recipe",
  name = "replicating-fast-blood-belt",
  enabled = false,
  ingredients = {
    {'blood-belt-fast', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-fast-blood-belt",
}

local replicating_express_blood_belt = {
  type = "recipe",
  name = "replicating-express-blood-belt",
  enabled = false,
  ingredients = {
    {'blood-belt-express', 1},
    {'electronic-circuit', 1},
  },
  result = "replicating-express-blood-belt",
}

data:extend{replicating_blood_belt, replicating_fast_blood_belt, replicating_express_blood_belt}
