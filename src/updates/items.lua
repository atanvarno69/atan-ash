-- Allow use of productivity modules
--   Will update any module that's `name` contains "productivity-module", including any modules added by other mods in
--   their data.lua stage.
--   From base mod this updates: `productivity-module`, `productivity-module-2`, `productivity-module-3`
--   TODO: Consider instead finding any module with `module.category == "productivity"`?
for _, module in pairs(data.raw.module) do
    if module.name:find("productivity%-module") and module.limitation ~= nil then
        table.insert(data.raw.module[module.name].limitation, "atan-ash-seperation")
    end
end

-- Make ash the product of burning chemical fuel
--    Will update any item with `item.fuel_category == "chemical"`, including items added by other mods in their
--    data.lua stage.
--    From base mod this updates: `coal`, `nuclear-fuel`, `rocket-fuel`, `solid-fuel`, `wood`
for _, item in pairs(data.raw.item) do
    if item.fuel_category ~= nil and item.fuel_category == "chemical" then
        data.raw.item[item.name].burnt_result = "atan-ash"
    end
end
