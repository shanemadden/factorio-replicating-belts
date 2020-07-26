if mods["Krastorio2"] then
  local replicating_kr_advanced_transport_belt = {
    type = "item-with-label",
    name = "replicating-kr-advanced-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.kr-advanced-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-g[replicating-kr-advanced-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/krastorio2/replicating-kr-advanced-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-kr-advanced-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_kr_superior_transport_belt = {
    type = "item-with-label",
    name = "replicating-kr-superior-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.kr-superior-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-h[replicating-kr-superior-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/krastorio2/replicating-kr-superior-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-kr-superior-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  data:extend{replicating_kr_advanced_transport_belt, replicating_kr_superior_transport_belt}
end
