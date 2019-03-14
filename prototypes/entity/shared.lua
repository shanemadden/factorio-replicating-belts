replicating_belts = {}
function replicating_belts.entity(name, settings)
  local entity = table.deepcopy(data.raw["transport-belt"][settings.copy])
  -- set the name and mining result to the replicating belt type
  entity.name = name
  entity.minable.result = name
  entity.icon = settings.icon
  entity.localised_name = {"replicating-belts.prefix", {[1] = string.format("replicating-belts.%s-lower", settings.copy)}}
  entity.belt_animation_set = {
    animation_set =
    {
      layers = {
        {
          filename = "__replicating-belts__/graphics/entity/transport-belt/belt.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          frame_count = 32,
          direction_count = 20,
          hr_version =
          {
            filename = "__replicating-belts__/graphics/entity/transport-belt/hr-belt.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            scale = 0.5,
            frame_count = 32,
            direction_count = 20
          }
        },
        {
          filename = "__replicating-belts__/graphics/entity/transport-belt/belt-arrows.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          frame_count = 32,
          direction_count = 20,
          tint = settings.tint,
          hr_version =
          {
            filename = "__replicating-belts__/graphics/entity/transport-belt/hr-belt-arrows.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            scale = 0.5,
            frame_count = 32,
            direction_count = 20,
            tint = settings.tint,
          },
        }
      }
    },

    east_index = 1,
    west_index = 2,
    north_index = 3,
    south_index = 4,

    east_to_north_index = 5,
    north_to_east_index = 6,

    west_to_north_index = 7,
    north_to_west_index = 8,

    south_to_east_index = 9,
    east_to_south_index = 10,

    south_to_west_index = 11,
    west_to_south_index = 12,

    starting_south_index = 13,
    ending_south_index = 14,

    starting_west_index = 15,
    ending_west_index = 16,

    starting_north_index = 17,
    ending_north_index = 18,

    starting_east_index = 19,
    ending_east_index = 20
  }
  data:extend({entity})
end
