local replicating_turbo_transport_belt = {
  type = "item-with-label",
  name = "replicating-turbo-transport-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-h[replicating-turbo-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/bob/replicating-purple-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-turbo-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_ultrabob_transport_belt = {
  type = "item-with-label",
  name = "replicating-ultrabob-transport-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-g[replicating-ultrabob-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/bob/replicating-green-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-ultrabob-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

data:extend{replicating_turbo_transport_belt, replicating_ultrabob_transport_belt}
