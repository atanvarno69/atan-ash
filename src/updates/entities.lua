local function contains(haystack, needle)
    for _, value in pairs(haystack) do
        if value == needle then
            return true
        end
    end
    return false
end

-- Allow electric furnaces to smelt ash
table.insert(data.raw["furnace"]["electric-furnace"].crafting_categories, "atan-advanced-smelting")

-- Add burnt inventory slots to burner entities
--    Will update any entity with `entity.energy_source.type == "burner"` set and
--    `entity.energy_source.fuel_categories` contains `"burner"` to have as many burnt inventory slots as fuel
--    inventory slots, including entities added by other mods in their data.lua stage.
--
--    From base mod this updates: `boiler`, `steel-furnace`, `stone-furnace`, `burner-inserter`, `burner-mining-drill`,
--    `burner-generator`, `car`, `tank`, `locomotive`
for category_id, category in pairs(data.raw) do
    for entity_id, entity in pairs(category) do
        if
            entity["energy_source"] ~= nil
            and entity.energy_source.type == "burner"
            and entity.energy_source.fuel_categories
            and contains(entity.energy_source.fuel_categories, "chemical")
        then
            data.raw[category_id][entity_id]["energy_source"].burnt_inventory_size =
                entity["energy_source"].fuel_inventory_size
        end
    end
end
