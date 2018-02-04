local replicating_blood_belt = {
  type = "technology",
  name = "replicating-blood-belt",
  icon = "__replicating-belts__/graphics/technology/replicating-blood-belt.png",
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
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 30,
  },
  order = "a-f-b-x",
}

data:extend{replicating_blood_belt}
