local subgroup = {
  type = "item-subgroup",
  name = "replicating-belt",
  group = "logistics",
  order = "b-z",
}

local replicating_transport_belt = {
  type = "item-with-label",
  name = "replicating-transport-belt",
  subgroup = "replicating-belt",
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
  can_be_mod_opened = true,
}

local replicating_fast_transport_belt = {
  type = "item-with-label",
  name = "replicating-fast-transport-belt",
  subgroup = "replicating-belt",
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
  can_be_mod_opened = true,
}

local replicating_express_transport_belt = {
  type = "item-with-label",
  name = "replicating-express-transport-belt",
  subgroup = "replicating-belt",
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
  can_be_mod_opened = true,
}

data:extend{subgroup, replicating_transport_belt, replicating_fast_transport_belt, replicating_express_transport_belt}
