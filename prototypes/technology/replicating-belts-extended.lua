local replicating_blistering_transport_belt = {
  type = "technology",
  name = "replicating-blistering-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.blistering-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.blistering-transport-belt-lower"}},
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
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
  order = "f-b-a-y",
}

local replicating_furious_transport_belt = {
  type = "technology",
  name = "replicating-furious-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.furious-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.furious-transport-belt-lower"}},
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
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
    },
    time = 30,
  },
  order = "f-b-a-z",
}

data:extend{replicating_blistering_transport_belt, replicating_furious_transport_belt}
