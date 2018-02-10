local replicating_blood_belt = {
  type = "item",
  name = "replicating-blood-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-d[replicating-blood-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-blood-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-blood-belt",
  stack_size = 100,
}

local replicating_fast_blood_belt = {
  type = "item",
  name = "replicating-fast-blood-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-e[replicating-fast-blood-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-fast-blood-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-fast-blood-belt",
  stack_size = 100,
}

local replicating_express_blood_belt = {
  type = "item",
  name = "replicating-express-blood-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-f[replicating-express-blood-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-express-blood-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-express-blood-belt",
  stack_size = 100,
}

data:extend{replicating_blood_belt, replicating_fast_blood_belt, replicating_express_blood_belt}
