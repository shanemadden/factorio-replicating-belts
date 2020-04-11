if data.raw.item["5d-mk5-transport-belt"] then
  local replicating_5d_mk4 = {
    type = "item-with-label",
    name = "replicating-5d-mk4-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.5d-mk4-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-g[replicating-5d-mk4-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/5dim/replicating-5d-mk4-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-5d-mk4-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_5d_mk5 = {
    type = "item-with-label",
    name = "replicating-5d-mk5-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.5d-mk5-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-h[replicating-5d-mk5-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/5dim/replicating-5d-mk5-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-5d-mk5-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  data:extend{replicating_5d_mk4, replicating_5d_mk5}
end
