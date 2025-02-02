local util = require("functions")

-- Update any capsule or item with `_.fuel_category == "chemical"`, including capsules/items added by other mods in
-- their data.lua stage.
--
-- Updates [base]: `coal`, `nuclear-fuel`, `rocket-fuel`, `solid-fuel`, `wood`
-- Updates [space-age]: `biter-egg`, `carbon`, `jellynut-seed`, `pentapod-egg`, `spoilage`, `tree-seed`, `yumako-seed`
for _, item in pairs(data.raw["item"]) do
    util.add_burnt_result(item, "atan-ash")
end

-- Updates [space-age]: `jelly`, `jellynut`, `yumako`, `yumako mash`
for _, capsule in pairs(data.raw["capsule"]) do
    util.add_burnt_result(capsule, "atan-ash")
end
