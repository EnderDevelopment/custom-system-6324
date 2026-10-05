local QBCore = exports['qb-core']:GetCoreObject()

-- Server-side event handler
RegisterNetEvent('customsystem:server:updateValue', function(value)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local playerId = Player.PlayerData.citizenid
        MySQL.update('UPDATE custom_system_data SET value = ? WHERE player_id = ?', {value, playerId}, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('customsystem:client:updateValue', src, value)
            else
                MySQL.insert('INSERT INTO custom_system_data (player_id, value) VALUES (?, ?)', {playerId, value}, function(id)
                    if id then
                        TriggerClientEvent('customsystem:client:updateValue', src, value)
                    end
                end)
            end
        end)
    end
end)

-- Callback to get player data
QBCore.Functions.CreateCallback('customsystem:server:getPlayerData', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local playerId = Player.PlayerData.citizenid
        MySQL.query('SELECT * FROM custom_system_data WHERE player_id = ?', {playerId}, function(result)
            if result[1] then
                cb(result[1])
            else
                cb(nil)
            end
        end)
    else
        cb(nil)
    end
end)