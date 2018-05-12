local replicating_5d_mk4 = {
  type = "technology",
  name = "replicating-5d-mk4-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.5d-mk4-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.5d-mk4-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/5dim/replicating-5d-mk4-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-5d-mk4-transport-belt",
    }
  },
  prerequisites = { "logistics-4", "replicating-transport-belt" },
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
  order = "f-b-a-y",
}

local replicating_5d_mk5 = {
  type = "technology",
  name = "replicating-5d-mk5-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.5d-mk5-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.5d-mk5-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/5dim/replicating-5d-mk5-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-5d-mk5-transport-belt",
    }
  },
  prerequisites = { "logistics-5", "replicating-5d-mk4-transport-belt" },
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
  order = "f-b-a-z",
}

data:extend{replicating_5d_mk4, replicating_5d_mk5}
