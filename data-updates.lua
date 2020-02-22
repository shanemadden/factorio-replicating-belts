if mods.boblogistics then
  require "prototypes.entity.replicating-belts-bob"
  require "prototypes.item.replicating-belts-bob"
  if data.raw.item["basic-transport-belt"] then
    require "prototypes.entity.replicating-belts-bob-basic"
    require "prototypes.item.replicating-belts-bob-basic"
  end
end
if data.raw.technology["ultimate-logistics"] then
  require "prototypes.entity.replicating-belts-ultimate"
  require "prototypes.item.replicating-belts-ultimate"
end
if data.raw.item["blood-belt"] then
  require "prototypes.entity.replicating-belts-blood"
  require "prototypes.item.replicating-belts-blood"
end
if data.raw.item["blistering-transport-belt"] then
  require "prototypes.entity.replicating-belts-extended"
  require "prototypes.item.replicating-belts-extended"
end
if data.raw.item["rapid-transport-belt-mk1"] then
  require "prototypes.entity.replicating-belts-extendedplus"
  require "prototypes.item.replicating-belts-extendedplus"
end
if data.raw.item["5d-mk5-transport-belt"] then
  require "prototypes.entity.replicating-belts-5dim"
  require "prototypes.item.replicating-belts-5dim"
end
if data.raw.item["giga-transport-belt"] then
  require "prototypes.entity.replicating-belts-dp77"
  require "prototypes.item.replicating-belts-dp77"
end
