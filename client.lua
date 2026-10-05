local QBCore = exports['qb-core']:GetCoreObject()

-- Client-side event handler
RegisterNetEvent('customsystem:client:updateValue', function(value)
    QBCore.Functions.Notify('Your value has been updated to: ' .. value, 'success')
end)

-- Command to update value
RegisterCommand('updatevalue', function(source, args)
    local value = tonumber(args[1])
    if value then
        TriggerServerEvent('customsystem:server:updateValue', value)
    else
        QBCore.Functions.Notify('Please provide a valid number', 'error')
    end
end, false)

-- Function to get player data
function GetPlayerData()
    QBCore.Functions.TriggerCallback('customsystem:server:getPlayerData', function(data)
        if data then
            print('Player data:', json.encode(data))
        else
            print('Failed to retrieve player data')
        end
    end)
end