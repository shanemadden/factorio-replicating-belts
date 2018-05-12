local replicating_ultra_fast_belt = {
  type = "technology",
  name = "replicating-ultra-fast-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultra-fast-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.ultra-fast-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/ultimate/replicating-ultra-fast-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-ultra-fast-belt"
    }
  },
  prerequisites = { "ultra-fast-logistics", "replicating-transport-belt" },
  unit = {
    count = 500,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
    },
    time = 30,
  },
  order = "a-f-d-y",
}

local replicating_extreme_fast_belt = {
  type = "technology",
  name = "replicating-extreme-fast-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.extreme-fast-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.extreme-fast-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/ultimate/replicating-extreme-fast-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-extreme-fast-belt"
    }
  },
  prerequisites = { "extreme-fast-logistics", "replicating-ultra-fast-belt" },
  unit = {
    count = 500,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-e-y",
}

local replicating_ultra_express_belt = {
  type = "technology",
  name = "replicating-ultra-express-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultra-express-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.ultra-express-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/ultimate/replicating-ultra-express-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-ultra-express-belt"
    }
  },
  prerequisites = { "ultra-express-logistics", "replicating-extreme-fast-belt" },
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
  order = "a-f-f-y",
}

local replicating_extreme_express_belt = {
  type = "technology",
  name = "replicating-extreme-express-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.extreme-express-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.extreme-express-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/ultimate/replicating-extreme-express-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-extreme-express-belt"
    }
  },
  prerequisites = { "extreme-express-logistics", "replicating-ultra-express-belt" },
  unit = {
    count = 1000,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-g-y",
}

local replicating_ultimate_transport_belt = {
  type = "technology",
  name = "replicating-ultimate-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.ultimate-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.ultimate-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/ultimate/replicating-ultimate-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-ultimate-transport-belt"
    }
  },
  prerequisites = { "ultimate-logistics", "replicating-extreme-express-belt" },
  unit = {
    count = 2000,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-h-y",
}

data:extend{replicating_ultra_fast_belt, replicating_extreme_fast_belt, replicating_ultra_express_belt, replicating_extreme_express_belt, replicating_ultimate_transport_belt}
