local replicating_turbo_transport_belt = {
  type = "technology",
  name = "replicating-turbo-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.turbo-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.turbo-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/bob/replicating-purple-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-turbo-transport-belt",
    }
  },
  prerequisites = { "logistics-4", "replicating-express-transport-belt" },
  unit = {
    count = 500,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-d-z",
}

local replicating_ultrabob_transport_belt = {
  type = "technology",
  name = "replicating-ultrabob-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultimate-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.ultimate-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/bob/replicating-green-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-ultrabob-transport-belt"
    }
  },
  prerequisites = { "logistics-5", "replicating-turbo-transport-belt" },
  unit = {
    count = 1000,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-e-z",
}

data:extend{replicating_turbo_transport_belt, replicating_ultrabob_transport_belt}
