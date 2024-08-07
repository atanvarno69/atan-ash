for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes
    if technologies["landfill"].researched then
        recipes["atan-landfill-from-ash"].enabled = true
    end
    if technologies["advanced-material-processing-2"].researched then
        recipes["atan-stone-brick-from-ash"].enabled = true
    end
    if technologies["automation-3"].researched then
        recipes["atan-ash-seperation"].enabled = true
    end
end
