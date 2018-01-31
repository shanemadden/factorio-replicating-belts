local replicating_ultra_fast_belt = {
  type = "item",
  name = "replicating-ultra-fast-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-d[replicating-ultra-fast-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-ultra-fast-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-ultra-fast-belt",
  stack_size = 100,
}

local replicating_extreme_fast_belt = {
  type = "item",
  name = "replicating-extreme-fast-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-e[replicating-extreme-fast-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-extreme-fast-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-extreme-fast-belt",
  stack_size = 100,
}

local replicating_ultra_express_belt = {
  type = "item",
  name = "replicating-ultra-express-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-f[replicating-ultra-express-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-ultra-express-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-ultra-express-belt",
  stack_size = 100,
}

local replicating_extreme_express_belt = {
  type = "item",
  name = "replicating-extreme-express-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-g[replicating-extreme-express-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-extreme-express-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-extreme-express-belt",
  stack_size = 100,
}

local replicating_ultimate_transport_belt = {
  type = "item",
  name = "replicating-ultimate-transport-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-h[replicating-ultimate-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-ultimate-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-ultimate-transport-belt",
  stack_size = 100,
}

data:extend{replicating_ultra_fast_belt, replicating_extreme_fast_belt, replicating_ultra_express_belt, replicating_extreme_express_belt, replicating_ultimate_transport_belt}
