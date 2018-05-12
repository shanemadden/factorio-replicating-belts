local replicating_rapid_mk1 = {
  type = "technology",
  name = "replicating-rapid-transport-belt-mk1",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.rapid-transport-belt-mk1-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.rapid-transport-belt-mk1-lower"}},
  icon = "__replicating-belts__/graphics/technology/bob/replicating-green-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-rapid-transport-belt-mk1",
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

local replicating_rapid_mk2 = {
  type = "technology",
  name = "replicating-rapid-transport-belt-mk2",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.rapid-transport-belt-mk2-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.rapid-transport-belt-mk2-lower"}},
  icon = "__replicating-belts__/graphics/technology/bob/replicating-purple-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-rapid-transport-belt-mk2"
    }
  },
  prerequisites = { "logistics-5", "replicating-rapid-transport-belt-mk1" },
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

data:extend{replicating_rapid_mk1, replicating_rapid_mk2}
