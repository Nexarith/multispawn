local spawns = {}
local storage = minetest.get_mod_storage()

-- loading saved spawnpoints
local saved = storage:get_string("spawns")
if saved ~= "" then
    spawns = minetest.deserialize(saved) or {}
end

-- saving spawnpoints
local function save_spawns()
    storage:set_string("spawns", minetest.serialize(spawns))
end

-- adding spawn command
minetest.register_chatcommand("addspawn", {
    privs = {server = true},
    description = "Add a spawnpoint at your position",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then return end

        local pos = vector.round(player:get_pos())
        table.insert(spawns, pos)
        save_spawns()

        return true, "Spawnpoint added!"
    end
})

-- teleporting player to random spawn
local function teleport_to_spawn(player)
    if #spawns == 0 then return end

    local spawn = spawns[math.random(#spawns)]
    player:set_pos(spawn)
end

-- on join
minetest.register_on_joinplayer(function(player)
    minetest.after(0.5, function()
        teleport_to_spawn(player)
    end)
end)

-- on respawn
minetest.register_on_respawnplayer(function(player)
    minetest.after(0.1, function()
        teleport_to_spawn(player)
    end)
    return true
end)

-- adding spawn command 
minetest.register_chatcommand("spawn", {
    description = "Teleport to a random spawn",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then return end

        if #spawns == 0 then
            return false, "No spawnpoints set!"
        end

        local spawn = spawns[math.random(#spawns)]
        player:set_pos(spawn)

        return true, "Teleported to spawn!"
    end
})

-- removing spawnpoint
minetest.register_chatcommand("removespawn", {
    privs = {server = true},
    description = "Remove the nearest spawnpoint",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if not player then return end

        if #spawns == 0 then
            return false, "No spawnpoints to remove!"
        end

        local pos = player:get_pos()
        local closest_index = nil
        local closest_dist = math.huge

        for i, spawn in ipairs(spawns) do
            local dist = vector.distance(pos, spawn)
            if dist < closest_dist then
                closest_dist = dist
                closest_index = i
            end
        end

        if closest_index then
            table.remove(spawns, closest_index)
            save_spawns()
            return true, "Nearest spawnpoint removed!"
        end

        return false, "No spawnpoint found!"
    end
})
