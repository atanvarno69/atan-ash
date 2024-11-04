for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    if technologies["biochamber"] and technologies["biochamber"].researched then
        recipes["atan-nutrients-from-ash"].enabled = true
    end
    if technologies["foundation"] and technologies["foundation"].researched then
        recipes["atan-foundation-from-ash"].enabled = true
    end
end
