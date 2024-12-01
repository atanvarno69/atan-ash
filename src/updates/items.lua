-- Make ash the product of burning chemical fuel
local function add_ash_product(item)
    if item.fuel_category ~= nil and item.fuel_category == "chemical" then
        item.burnt_result = "atan-ash"
    end
end

-- Update any capsule or item with `_.fuel_category == "chemical"`, including capsules/items added by other mods in
-- their data.lua stage.
-- Updates [base]: `coal`, `nuclear-fuel`, `rocket-fuel`, `solid-fuel`, `wood`
-- Updates [space-age]: `biter-egg`, `carbon`, `jellynut-seed`, `pentapod-egg`, `spoilage`, `tree-seed`, `yumako-seed`
for _, item in pairs(data.raw["item"]) do
    add_ash_product(item)
end

-- Updates [space-age]: `jelly`, `jellynut`, `yumako`, `yumako mash`
for _, capsule in pairs(data.raw["capsule"]) do
    add_ash_product(capsule)
end
