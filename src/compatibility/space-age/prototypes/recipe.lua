if not mods["space-age"] then
    return
end

data:extend({
    {
        type = "recipe",
        name = "atan-nutrients-from-ash",
        category = "organic",
        subgroup = "agriculture-processes",
        enabled = false,
        allow_productivity = true,
        order = "c[nutrients]-d[nutrients-from-ash]",
        energy_required = 4,
        ingredients = {
            { type = "item", name = "atan-ash", amount = 20 },
            { type = "fluid", name = "water", amount = 50 },
        },
        results = {
            { type = "item", name = "nutrients", amount = 2 },
        },
        crafting_machine_tint = {
            primary = { r = 0.8, g = 0.9, b = 1, a = 1.000 },
            secondary = { r = 0.900, g = 0.137, b = 0.000, a = 1.000 }, -- #e52200ff
        },
        icon = "__atan-ash__/graphics/icons/nutrients-from-ash.png",
    },
    {
        type = "recipe",
        name = "atan-foundation-from-ash",
        energy_required = 30,
        enabled = false,
        category = "crafting-with-fluid",
        order = "c[landfill]-g[foundation]b",
        ingredients = {
            { type = "item", name = "tungsten-plate", amount = 4 },
            { type = "item", name = "lithium-plate", amount = 4 },
            { type = "item", name = "carbon-fiber", amount = 4 },
            { type = "item", name = "atan-ash", amount = 200 },
            { type = "fluid", name = "fluoroketone-cold", amount = 20 },
        },
        results = { { type = "item", name = "foundation", amount = 1 } },
        icon = "__atan-ash__/graphics/icons/foundation-from-ash.png",
    },
})
