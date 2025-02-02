local M = {}

function M.contains(haystack, needle)
    for _, value in pairs(haystack or {}) do
        if value == needle then
            return true
        end
    end
    return false
end

function M.add_burnt_result(item_or_capsule, burnt_result)
    if item_or_capsule.fuel_category and item_or_capsule.fuel_category == "chemical" then
        item_or_capsule.burnt_result = burnt_result
    end
end

function M.add_crafting_category(entity_type, entity_name, crafting_category)
    if not data.raw[entity_type][entity_name] then
        return
    end
    local entity = data.raw[entity_type][entity_name]
    if not entity.crafting_categories then
        entity.crafting_categories = {}
    end
    if not M.contains(entity.crafting_categories, crafting_category) then
        entity.crafting_categories[#entity.crafting_categories + 1] = crafting_category
    end
end

function M.add_recipe_unlock(technology_name, recipe_name)
    if not data.raw.technology[technology_name] then
        return
    end
    local technology = data.raw.technology[technology_name]
    if not technology.effects then
        technology.effects = {}
    end
    technology.effects[#technology.effects + 1] = { type = "unlock-recipe", recipe = recipe_name }
end

return M
