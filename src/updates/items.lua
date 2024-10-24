-- Make ash the product of burning chemical fuel
--    Will update any item with `item.fuel_category == "chemical"`, including items added by other mods in their
--    data.lua stage.
--    From base mod this updates: `coal`, `nuclear-fuel`, `rocket-fuel`, `solid-fuel`, `wood`
for _, item in pairs(data.raw.item) do
    if item.fuel_category ~= nil and item.fuel_category == "chemical" then
        data.raw.item[item.name].burnt_result = "atan-ash"
    end
end
