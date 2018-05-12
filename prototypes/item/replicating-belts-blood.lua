local replicating_blood_belt = {
  type = "item-with-label",
  name = "replicating-blood-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.blood-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-d[replicating-blood-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/blood/replicating-blood-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-blood-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_fast_blood_belt = {
  type = "item-with-label",
  name = "replicating-fast-blood-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.fast-blood-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-e[replicating-fast-blood-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/blood/replicating-fast-blood-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-fast-blood-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

local replicating_express_blood_belt = {
  type = "item-with-label",
  name = "replicating-express-blood-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.express-blood-belt-lower"}},
  subgroup = "replicating-belt",
  order = "d[replicating-transport-belt]-f[replicating-express-blood-belt]",
  icons = {
    {
      icon = "__replicating-belts__/graphics/icons/blood/replicating-express-blood-belt.png",
      icon_size = 32,
    }
  },
  flags = {"goes-to-quickbar"},
  place_result = "replicating-express-blood-belt",
  stack_size = 100,
  can_be_mod_opened = true,
}

data:extend{replicating_blood_belt, replicating_fast_blood_belt, replicating_express_blood_belt}
