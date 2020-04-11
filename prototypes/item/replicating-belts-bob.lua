if mods.boblogistics then
  local replicating_turbo_transport_belt = {
    type = "item-with-label",
    name = "replicating-turbo-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.turbo-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-g[replicating-turbo-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/bob/replicating-purple-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-turbo-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_ultrabob_transport_belt = {
    type = "item-with-label",
    name = "replicating-ultrabob-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultimate-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-h[replicating-ultrabob-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/bob/replicating-green-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-ultrabob-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  data:extend{replicating_turbo_transport_belt, replicating_ultrabob_transport_belt}
end
