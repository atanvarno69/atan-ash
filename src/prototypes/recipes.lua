data:extend({
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
        localised_name = { "recipe-name.atan-ash-seperation" },
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
                icon = "__atan-ash__/graphics/icons/ash-1.png",
                icon_size = 64,
            },
            {
                icon = "__base__/graphics/icons/coal.png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.25,
                shift = { -8, 8 },
            },
            {
                icon = "__base__/graphics/icons/iron-ore.png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.25,
                shift = { 8, 8 },
            },
        },
    },
})
