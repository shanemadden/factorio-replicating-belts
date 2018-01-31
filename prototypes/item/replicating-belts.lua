local replicating_transport_belt = {
  type = "item",
  name = "replicating-transport-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-a[replicating-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-transport-belt",
  stack_size = 100,
}

local replicating_fast_transport_belt = {
  type = "item",
  name = "replicating-fast-transport-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-b[replicating-fast-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-fast-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-fast-transport-belt",
  stack_size = 100,
}

local replicating_express_transport_belt = {
  type = "item",
  name = "replicating-express-transport-belt",
  subgroup = "belt",
  order = "d[replicating-transport-belt]-c[replicating-express-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/replicating-express-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-express-transport-belt",
  stack_size = 100,
}

data:extend{replicating_transport_belt, replicating_fast_transport_belt, replicating_express_transport_belt}
