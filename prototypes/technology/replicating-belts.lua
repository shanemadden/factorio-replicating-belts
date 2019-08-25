local replicating_transport_belt = {
  type = "technology",
  name = "replicating-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.transport-belt-lower"}},
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
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 15,
  },
  order = "a-f-a-z",
}

local replicating_fast_transport_belt = {
  type = "technology",
  name = "replicating-fast-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.fast-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.fast-transport-belt-lower"}},
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
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-b-z",
}

local replicating_express_transport_belt = {
  type = "technology",
  name = "replicating-express-transport-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.express-transport-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.express-transport-belt-lower"}},
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
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-c-z",
}

-- make replicating-transport-belt research depend on basic-replicating-transport-belt, if it exists
if mods.boblogistics and data.raw.item["basic-transport-belt"] then
  table.insert(replicating_transport_belt["prerequisites"], "replicating-basic-transport-belt")
end

data:extend{replicating_transport_belt, replicating_fast_transport_belt, replicating_express_transport_belt}
