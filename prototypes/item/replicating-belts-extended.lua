local replicating_blistering_transport_belt = {
  type = "item-with-label",
  name = "replicating-blistering-transport-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-g[replicating-blistering-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/extended/replicating-blistering-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-blistering-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_furious_transport_belt = {
  type = "item-with-label",
  name = "replicating-furious-transport-belt",
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-h[replicating-furious-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/extended/replicating-furious-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-furious-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

data:extend{replicating_blistering_transport_belt, replicating_furious_transport_belt}
