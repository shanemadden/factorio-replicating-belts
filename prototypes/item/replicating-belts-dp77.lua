local replicating_swift_transport_belt = {
  type = "item-with-label",
  name = "replicating-swift-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.swift-transport-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-i[replicating-swift-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/dp77/replicating-swift-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-swift-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_elite_transport_belt = {
  type = "item-with-label",
  name = "replicating-elite-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.elite-transport-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-j[replicating-elite-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/dp77/replicating-elite-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-elite-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_sonic_transport_belt = {
  type = "item-with-label",
  name = "replicating-sonic-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.sonic-transport-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-k[replicating-sonic-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/dp77/replicating-sonic-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-sonic-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_hyper_transport_belt = {
  type = "item-with-label",
  name = "replicating-hyper-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.hyper-transport-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-l[replicating-hyper-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/dp77/replicating-hyper-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-hyper-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_stealt_transport_belt = {
  type = "item-with-label",
  name = "replicating-stealt-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.stealt-transport-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-m[replicating-stealt-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/dp77/replicating-stealt-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-stealt-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_giga_transport_belt = {
  type = "item-with-label",
  name = "replicating-giga-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.giga-transport-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-n[replicating-giga-transport-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/dp77/replicating-giga-transport-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-giga-transport-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}


data:extend{replicating_swift_transport_belt, replicating_elite_transport_belt, replicating_sonic_transport_belt, replicating_hyper_transport_belt, replicating_stealt_transport_belt, replicating_giga_transport_belt}
