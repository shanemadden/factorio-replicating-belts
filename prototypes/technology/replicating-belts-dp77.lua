local replicating_swift_transport_belt = {
  type = "technology",
  name = "replicating-swift-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.swift-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.swift-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/dp77/replicating-swift-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-swift-transport-belt"
    }
  },
  prerequisites = { "logistics-4", "replicating-transport-belt" },
  unit = {
    count = 600,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-d-y",
}

local replicating_elite_transport_belt = {
  type = "technology",
  name = "replicating-elite-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.elite-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.elite-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/dp77/replicating-elite-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-elite-transport-belt"
    }
  },
  prerequisites = { "logistics-5", "replicating-swift-transport-belt" },
  unit = {
    count = 900,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
      {"science-pack-3", 1},
      {"science-pack-4", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-e-y",
}

local replicating_sonic_transport_belt = {
  type = "technology",
  name = "replicating-sonic-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.sonic-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.sonic-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/dp77/replicating-sonic-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-sonic-transport-belt"
    }
  },
  prerequisites = { "logistics-6", "replicating-elite-transport-belt" },
  unit = {
    count = 1100,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
      {"science-pack-3", 2},
      {"science-pack-4", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
      {"space-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-f-y",
}

local replicating_hyper_transport_belt = {
  type = "technology",
  name = "replicating-hyper-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.hyper-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.hyper-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/dp77/replicating-hyper-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-hyper-transport-belt"
    }
  },
  prerequisites = { "logistics-7", "replicating-sonic-transport-belt" },
  unit = {
    count = 1200,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
      {"science-pack-3", 2},
      {"science-pack-4", 1},
      {"science-pack-5", 1},
      {"science-pack-6", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
      {"space-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-g-y",
}

local replicating_stealt_transport_belt = {
  type = "technology",
  name = "replicating-stealt-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.stealt-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.stealt-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/dp77/replicating-stealt-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-stealt-transport-belt"
    }
  },
  prerequisites = { "logistics-8", "replicating-hyper-transport-belt" },
  unit = {
    count = 1500,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
      {"science-pack-3", 2},
      {"science-pack-4", 2},
      {"science-pack-5", 1},
      {"science-pack-6", 1},
      {"production-science-pack", 1},
      {"production-science-pack-2", 1},
      {"high-tech-science-pack", 1},
      {"space-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-h-y",
}

local replicating_giga_transport_belt = {
  type = "technology",
  name = "replicating-giga-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.giga-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.giga-transport-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/dp77/replicating-giga-transport-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-giga-transport-belt"
    }
  },
  prerequisites = { "logistics-9", "replicating-stealt-transport-belt" },
  unit = {
    count = 1800,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
      {"science-pack-3", 2},
      {"science-pack-4", 2},
      {"science-pack-5", 1},
      {"science-pack-6", 1},
      {"production-science-pack", 2},
      {"production-science-pack-2", 1},
      {"high-tech-science-pack", 1},
      {"high-tech-science-pack-2", 1},
      {"space-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-i-y",
}

data:extend{replicating_swift_transport_belt, replicating_elite_transport_belt, replicating_sonic_transport_belt, replicating_hyper_transport_belt, replicating_stealt_transport_belt, replicating_giga_transport_belt}
