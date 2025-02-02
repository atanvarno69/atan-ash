local M = {}

M.amounts = {
    -- Default
    ["unset"] = { min = 0, max = 0 },
    -- Tree
    ["tree"] = { min = 3, max = 8 },
    -- Biter spawners
    ["biter-spawner"] = { min = 3, max = 10 },
    ["spitter-spawner"] = { min = 3, max = 8 },
    -- Pentapod spawners
    ["gleba-spawner"] = { min = 3, max = 10 },
    ["gleba-spawner-small"] = { min = 3, max = 6 },
    -- Worms
    ["behemoth-worm-turret"] = { min = 2, max = 8 },
    ["big-worm-turret"] = { min = 1, max = 5 },
    ["medium-worm-turret"] = { min = 1, max = 3 },
    ["small-worm-turret"] = { min = 1, max = 2 },
    -- Biters and spitters
    ["behemoth-biter"] = { min = 1, max = 8 },
    ["behemoth-spitter"] = { min = 1, max = 6 },
    ["big-biter"] = { min = 0, max = 5 },
    ["big-spitter"] = { min = 0, max = 4 },
    ["medium-biter"] = { min = 0, max = 3 },
    ["medium-spitter"] = { min = 0, max = 2 },
    ["small-biter"] = { min = 0, max = 2 },
    ["small-spitter"] = { min = 0, max = 1 },
    -- Pentapods
    ["big-stomper-pentapod"] = { min = 2, max = 10 },
    ["big-strafer-pentapod"] = { min = 1, max = 8 },
    ["big-wriggler-pentapod"] = { min = 1, max = 6 },
    ["big-wriggler-pentapod-premature"] = { min = 0, max = 4 },
    ["medium-stomper-pentapod"] = { min = 1, max = 8 },
    ["medium-strafer-pentapod"] = { min = 0, max = 6 },
    ["medium-wriggler-pentapod"] = { min = 0, max = 4 },
    ["medium-wriggler-pentapod-premature"] = { min = 0, max = 3 },
    ["small-stomper-pentapod"] = { min = 1, max = 6 },
    ["small-strafer-pentapod"] = { min = 0, max = 4 },
    ["small-wriggler-pentapod"] = { min = 0, max = 2 },
    ["small-wriggler-pentapod-premature"] = { min = 0, max = 1 },
}

function M.get_amount(name)
    if not M.amounts[name] then
        name = unset
    end
    return math.random(M.amounts[name].min, M.amounts[name].max)
end

function M.drop_ash(surface_name, position, amount)
    game.surfaces[surface_name].spill_item_stack({
        position = position,
        stack = { name = "atan-ash", count = amount },
        enable_looted = true,
    })
end

function M.on_entity_died(event)
    if not event.damage_type then
        return
    end
    if event.damage_type ~= "fire" then
        return
    end
    local amount = 0
    if (event.entity.is_military_target and event.entity.force.name == "enemy") or (event.entity.type == "tree") then
        amount = M.get_amount(event.entity.name)
    end
    if amount == 0 then
        return
    end
    M.drop_ash(event.entity.surface_name, event.entity.position, amount)
end

function M.on_init()
    if settings.startup["atan-ash-entities-burn"].value then
        script.on_event(defines.events.on_entity_died, M.on_entity_died)
    else
        script.on_event(defines.events.on_entity_died, nil)
    end
end

return M
