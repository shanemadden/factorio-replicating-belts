if data.raw.item["rapid-transport-belt-mk1"] then
  local replicating_rapid_mk1 = {
    type = "item-with-label",
    name = "replicating-rapid-transport-belt-mk1",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.rapid-transport-belt-mk1-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-g[replicating-rapid-transport-belt-mk1]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/bob/replicating-green-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-rapid-transport-belt-mk1",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  local replicating_rapid_mk2 = {
    type = "item-with-label",
    name = "replicating-rapid-transport-belt-mk2",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.rapid-transport-belt-mk2-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-h[replicating-rapid-transport-belt-mk2]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/bob/replicating-purple-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-rapid-transport-belt-mk2",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  data:extend{replicating_rapid_mk1, replicating_rapid_mk2}
end
