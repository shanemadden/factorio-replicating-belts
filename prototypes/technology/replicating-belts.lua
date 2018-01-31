local replicating_transport_belt = {
  type = "technology",
  name = "replicating-transport-belt",
  icon = "__replicating-belts__/graphics/technology/replicating-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-transport-belt"
    }
  },
  prerequisites = { "logistics" },
  unit = {
    count = 100,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 15,
  },
  order = "a-f-a-z",
}

local replicating_fast_transport_belt = {
  type = "technology",
  name = "replicating-fast-transport-belt",
  icon = "__replicating-belts__/graphics/technology/replicating-fast-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-fast-transport-belt"
    }
  },
  prerequisites = { "logistics-2", "replicating-transport-belt" },
  unit = {
    count = 500,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 30,
  },
  order = "a-f-b-z",
}

local replicating_express_transport_belt = {
  type = "technology",
  name = "replicating-express-transport-belt",
  icon = "__replicating-belts__/graphics/technology/replicating-express-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-express-transport-belt"
    }
  },
  prerequisites = { "logistics-3", "replicating-fast-transport-belt" },
  unit = {
    count = 1000,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-c-z",
}

data:extend{replicating_transport_belt, replicating_fast_transport_belt, replicating_express_transport_belt}
