local replicating_blood_belt = {
  type = "technology",
  name = "replicating-blood-belt",
  localised_name = {"replicating-belts.prefix", {[1] = "replicating-belts.blood-belt-lower"}},
  localised_description = {"replicating-belts.technology-description", {[1] = "replicating-belts.blood-belt-lower"}},
  icon = "__replicating-belts__/graphics/technology/blood/replicating-blood-belt.png",
  icon_size = 128,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "replicating-blood-belt"
    },
    {
      type = "unlock-recipe",
      recipe = "replicating-fast-blood-belt"
    },
    {
      type = "unlock-recipe",
      recipe = "replicating-express-blood-belt"
    },
  },
  prerequisites = { "replicating-transport-belt" },
  unit = {
    count = 500,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
    },
    time = 30,
  },
  order = "a-f-b-x",
}

data:extend{replicating_blood_belt}
