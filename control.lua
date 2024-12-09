--control.lua
if script.active_mods["gvv"] then require("__gvv__.gvv")() end


script.on_event(defines.events.on_entity_died,
    function(event) -- event handler function
        local entity = event.entity    -- Gets the entity that died (as an entity)
        local entity_type = entity.type -- Gets the type of entity that died (as a string)
        local entity_position = entity.position    -- Maybe gets the position of the entity that died or at least a position nearby enough
        local entity_killer = event.cause   -- Gets the killer of the entity that died as an entity data type

        -- if the entity that dies was a tree and it was killed by a player, spawn a small biter where the tree was
        if entity_type == "tree" and entity_killer then
            if entity_killer.type == "character" or
                entity_killer.type == "fire" or
                entity_killer.type == "artillery-turret" or
                entity_killer.type == "car" then
                game.get_surface(1).create_entity{name="small-biter", position = entity_position}
                
            else
                game.print(entity)
            end
        end
    end
)