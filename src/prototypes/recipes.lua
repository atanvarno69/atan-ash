data:extend({
    {
        type = "recipe",
        name = "atan-landfill-from-ash",
        category = "advanced-crafting",
        order = "c[landfill]-b",
        energy_required = 0.5,
        enabled = false,
        ingredients = {
            { type = "item", name = "atan-ash", amount = 250 },
            { type = "item", name = "stone", amount = 25 },
        },
        results = {
            { type = "item", name = "landfill", amount = 1 },
        },
        icon = "__atan-ash__/graphics/icons/landfill-from-ash.png",
        icon_size = 64,
    },
    {
        type = "recipe",
        name = "atan-stone-brick-from-ash",
        category = "atan-advanced-smelting",
        order = "a[stone-brick]b",
        energy_required = 3.2,
        enabled = false,
        ingredients = {
            { type = "item", name = "atan-ash", amount = 20 },
        },
        results = {
            { type = "item", name = "stone-brick", amount = 1 },
        },
        icon = "__atan-ash__/graphics/icons/stone-brick-from-ash.png",
        icon_size = 64,
    },
    {
        type = "recipe",
        name = "atan-ash-seperation",
        localised_name = { "recipe-name.atan-ash-seperation" },
        category = "advanced-crafting",
        order = "k[ash]b",
        energy_required = 1,
        enabled = false,
        ingredients = {
            { type = "item", name = "atan-ash", amount = 10 },
        },
        results = {
            { type = "item", name = "iron-ore", amount = 1, probability = 0.05 },
            { type = "item", name = "coal", amount = 1, probability = 0.5 },
        },
        main_product = "coal",
        allow_productivity = true,
        icon = "__atan-ash__/graphics/icons/ash-seperation.png",
        icon_size = 64,
    },
})
