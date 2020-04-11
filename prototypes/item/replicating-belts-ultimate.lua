if data.raw.technology["ultimate-logistics"] then
  local replicating_ultra_fast_belt = {
    type = "item-with-label",
    name = "replicating-ultra-fast-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultra-fast-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-i[replicating-ultra-fast-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/ultimate/replicating-ultra-fast-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-ultra-fast-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_extreme_fast_belt = {
    type = "item-with-label",
    name = "replicating-extreme-fast-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.extreme-fast-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-j[replicating-extreme-fast-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/ultimate/replicating-extreme-fast-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-extreme-fast-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_ultra_express_belt = {
    type = "item-with-label",
    name = "replicating-ultra-express-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultra-express-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-k[replicating-ultra-express-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/ultimate/replicating-ultra-express-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-ultra-express-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_extreme_express_belt = {
    type = "item-with-label",
    name = "replicating-extreme-express-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.extreme-express-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-l[replicating-extreme-express-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/ultimate/replicating-extreme-express-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-extreme-express-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_ultimate_transport_belt = {
    type = "item-with-label",
    name = "replicating-ultimate-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultimate-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-m[replicating-ultimate-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/ultimate/replicating-ultimate-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-ultimate-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  data:extend{replicating_ultra_fast_belt, replicating_extreme_fast_belt, replicating_ultra_express_belt, replicating_extreme_express_belt, replicating_ultimate_transport_belt}
end
