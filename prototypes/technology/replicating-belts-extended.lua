local replicating_blistering_transport_belt = {
  type = "technology",
  name = "replicating-blistering-transport-belt",
  icon = "__replicating-belts__/graphics/technology/extended/replicating-blistering-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-blistering-transport-belt",
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

local replicating_furious_transport_belt = {
  type = "technology",
  name = "replicating-furious-transport-belt",
  icon = "__replicating-belts__/graphics/technology/extended/replicating-furious-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-furious-transport-belt"
    }
  },
  prerequisites = { "logistics-5", "replicating-blistering-transport-belt" },
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

data:extend{replicating_blistering_transport_belt, replicating_furious_transport_belt}
