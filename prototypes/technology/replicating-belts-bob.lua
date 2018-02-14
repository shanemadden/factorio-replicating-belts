local replicating_green_transport_belt = {
  type = "technology",
  name = "replicating-green-transport-belt",
  icon = "__replicating-belts__/graphics/technology/bob/replicating-green-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-green-transport-belt",
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

local replicating_purple_transport_belt = {
  type = "technology",
  name = "replicating-purple-transport-belt",
  icon = "__replicating-belts__/graphics/technology/bob/replicating-purple-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-purple-transport-belt"
    }
  },
  prerequisites = { "bob-logistics-5", "replicating-green-transport-belt" },
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

data:extend{replicating_green_transport_belt, replicating_purple_transport_belt}
