-- Allow electric furnaces to smelt ash
table.insert(data.raw["furnace"]["electric-furnace"].crafting_categories, "atan-advanced-smelting")

-- Add burnt inventory slots to burner entities
--    Will update any entity with `entity.energy_source.type == "burner"` or `entity.burner` set to have as many burnt
--    inventory slots as fuel inventory slots, including entities added by other mods in their data.lua stage.
--    From base mod this updates: `boiler`, `steel-furnace`, `stone-furnace`, `burner-inserter`, `burner-mining-drill`,
--    `nuclear-reactor`, `burner-generator`, `car`, `tank`, `locomotive`
--    TODO: This should probably not alter `nuclear-reactor` since it has `fuel_category = "nuclear"`, not chemical?
for category_id, category in pairs(data.raw) do
    for entity_id, entity in pairs(category) do
        if entity["energy_source"] ~= nil and entity["energy_source"].type == "burner" then
            data.raw[category_id][entity_id]["energy_source"].burnt_inventory_size =
                entity["energy_source"].fuel_inventory_size
        elseif entity["burner"] ~= nil then
            data.raw[category_id][entity_id]["burner"].burnt_inventory_size = entity["burner"].fuel_inventory_size
        end
    end
end
