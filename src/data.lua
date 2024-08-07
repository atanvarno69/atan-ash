-- Add ash item
data:extend({
    {
        type = "item",
        name = "atan-ash",
        icon = "__atan-ash__/graphics/icons/ash-1.png",
        icon_size = 64,
        subgroup = "raw-resource",
        order = "i[ash]",
        stack_size = 100,
        pictures = {
            { size = 64, filename = "__atan-ash__/graphics/icons/ash-1.png", scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = "__atan-ash__/graphics/icons/ash-2.png", scale = 0.25, mipmap_count = 4 },
            { size = 64, filename = "__atan-ash__/graphics/icons/ash-3.png", scale = 0.25, mipmap_count = 4 },
        },
    },
})

-- Make ash the product of burning chemical fuel
for _, item in pairs(data.raw.item) do
    if item.fuel_category ~= nil and item.fuel_category == "chemical" then
        data.raw.item[item.name].burnt_result = "atan-ash"
    end
end

-- Add burnt inventory slots to burner entities
for cat_name, category in pairs(data.raw) do
    for ent_name, entity in pairs(category) do
        if entity["energy_source"] ~= nil and entity["energy_source"].type == "burner" then
            data.raw[cat_name][ent_name]["energy_source"].burnt_inventory_size =
                entity["energy_source"].fuel_inventory_size
        elseif entity["burner"] ~= nil then
            data.raw[cat_name][ent_name]["burner"].burnt_inventory_size = entity["burner"].fuel_inventory_size
        end
    end
end

-- Ash recipes
data:extend({
    {
        type = "recipe-category",
        name = "atan-advanced-smelting",
    },
    {
        type = "recipe",
        name = "atan-landfill-from-ash",
        category = "advanced-crafting",
        energy_required = 0.5,
        enabled = false,
        ingredients = {
            { "atan-ash", 100 },
            { "stone", 10 },
        },
        result = "landfill",
        result_count = 1,
        icons = {
            {
                icon = "__base__/graphics/icons/landfill.png",
                icon_size = 64,
                icon_mipmaps = 4,
            },
            {
                icon = "__atan-ash__/graphics/icons/ash-1.png",
                icon_size = 64,
                scale = 0.25,
                shift = { -8, 8 },
            },
        },
    },
    {
        type = "recipe",
        name = "atan-stone-brick-from-ash",
        category = "atan-advanced-smelting",
        energy_required = 3.2,
        enabled = false,
        ingredients = {
            { "atan-ash", 20 },
        },
        result = "stone-brick",
        result_count = 1,
        icons = {
            {
                icon = "__base__/graphics/icons/stone-brick.png",
                icon_size = 64,
                icon_mipmaps = 4,
            },
            {
                icon = "__atan-ash__/graphics/icons/ash-1.png",
                icon_size = 64,
                scale = 0.25,
                shift = { -8, 8 },
            },
        },
    },
    {
        type = "recipe",
        name = "atan-ash-seperation",
        category = "advanced-crafting",
        energy_required = 1,
        enabled = false,
        ingredients = {
            { "atan-ash", 10 },
        },
        results = {
            { type = "item", name = "iron-ore", amount = 1, probability = 0.05 },
            { type = "item", name = "coal", amount = 1, probability = 0.5 },
        },
        main_product = "coal",
        icons = {
            {
                icon = "__base__/graphics/icons/coal.png",
                icon_size = 64,
                icon_mipmaps = 4,
            },
            {
                icon = "__atan-ash__/graphics/icons/ash-1.png",
                icon_size = 64,
                scale = 0.25,
                shift = { -8, 8 },
            },
        },
    },
})

-- Allow electric furnaces to smelt ash
table.insert(data.raw["furnace"]["electric-furnace"].crafting_categories, "atan-advanced-smelting")

-- Technology unlocks
table.insert(data.raw.technology["landfill"].effects, { type = "unlock-recipe", recipe = "atan-landfill-from-ash" })
table.insert(
    data.raw.technology["advanced-material-processing-2"].effects,
    { type = "unlock-recipe", recipe = "atan-stone-brick-from-ash" }
)
table.insert(data.raw.technology["automation-3"].effects, { type = "unlock-recipe", recipe = "atan-ash-seperation" })

-- Allow use of productivity modules
for _, module in pairs(data.raw.module) do
    if module.name:find("productivity%-module") and module.limitation then
        table.insert(module.limitation, "atan-ash-seperation")
    end
end
