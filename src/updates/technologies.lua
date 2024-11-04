table.insert(data.raw.technology["landfill"].effects, { type = "unlock-recipe", recipe = "atan-landfill-from-ash" })
table.insert(
    data.raw.technology["advanced-material-processing-2"].effects,
    { type = "unlock-recipe", recipe = "atan-stone-brick-from-ash" }
)
table.insert(data.raw.technology["automation-3"].effects, { type = "unlock-recipe", recipe = "atan-ash-seperation" })

if mods["space-age"] then
    table.insert(
        data.raw.technology["biochamber"].effects,
        { type = "unlock-recipe", recipe = "atan-nutrients-from-ash" }
    )
    table.insert(
        data.raw.technology["foundation"].effects,
        { type = "unlock-recipe", recipe = "atan-foundation-from-ash" }
    )
end
