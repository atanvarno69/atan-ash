local function drop_ash(surface_name, position, amount)
    game.print("[item=atan-ash]", { game_state = false })
    game.surfaces[surface_name].spill_item_stack(position, { name = "atan-ash", count = amount }, true)
end

local function on_enity_died(event)
    if event.damage_type and event.damage_type.name == "fire" then
        local amount = 0
        if event.entity.is_military_target and event.entity.force.name == "enemy" then
            if event.entity.name:find("%-spawner") then
                amount = math.random(3, 10)
            elseif event.entity.name:find("behemoth%-") then
                amount = math.random(1, 8)
            elseif event.entity.name:find("big%-") then
                amount = math.random(0, 4)
            elseif event.entity.name:find("medium%-") then
                amount = math.random(0, 3)
            elseif event.entity.name:find("small%-") then
                amount = math.random(0, 2)
            end
        elseif event.entity.type == "tree" then
            amount = math.random(3, 8)
        end
        if amount > 0 then
            drop_ash(event.entity.surface.name, event.entity.position, amount)
        end
    end
end

local function init()
    if settings.startup["atan-ash-biters-burn"].value then
        script.on_event(defines.events.on_entity_died, on_enity_died)
    else
        script.on_event(defines.events.on_entity_died, nil)
    end
end

script.on_init(init)
script.on_configuration_changed(init)
