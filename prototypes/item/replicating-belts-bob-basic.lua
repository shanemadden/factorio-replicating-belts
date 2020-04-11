if data.raw.item["basic-transport-belt"] then
  local replicating_basic_transport_belt = {
    type = "item-with-label",
    name = "replicating-basic-transport-belt",
    localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.basic-transport-belt-lower"}},
    subgroup = "replicating-belt",
    order = "d[replicating-transport-belt]-0[replicating-basic-transport-belt]",
    icons = {
      {
        icon = "__replicating-belts__/graphics/icons/bob/replicating-grey-transport-belt.png",
        icon_size = 32,
      }
    },
    flags = {},
    place_result = "replicating-basic-transport-belt",
    stack_size = 100,
    can_be_mod_opened = true,
  }

  data:extend{replicating_basic_transport_belt}
end
