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
  prerequisites = { "bob-logistics-4", "replicating-transport-belt" },
  unit = {
    count = 500,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
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
  prerequisites = { "bob-logistics-5", "replicating-turbo-transport-belt" },
  unit = {
    count = 1000,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-e-z",
}

data:extend{replicating_turbo_transport_belt, replicating_ultrabob_transport_belt}
