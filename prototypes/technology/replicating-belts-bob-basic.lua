local replicating_basic_transport_belt = {
  type = "technology",
  name = "replicating-basic-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.basic-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.basic-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/bob/replicating-grey-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-basic-transport-belt",
    }
  },
  prerequisites = { "logistics-0" },
  unit = {
    count = 25,
    ingredients =
    {
      {"automation-science-pack", 1},
    },
    time = 10,
  },
  order = "a-f-d-z",
}

data:extend{replicating_basic_transport_belt}
