ESX = exports["es_extended"]:getSharedObject()



for index, item in ipairs(KVL['Sell']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local itemIndex = index
        local player = source
        local xPlayer = ESX.GetPlayerFromId(player)

        if not KVL['Sell'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..KVL['Locales']['invaliditem']..' ' })
            return
        end

        local itemName = KVL['Sell'][itemIndex].name
        local itemLabel = KVL['Sell'][itemIndex].label
        local itemPrice = KVL['Sell'][itemIndex].price

        if xPlayer.getInventoryItem(itemName).count >= count then
            xPlayer.removeInventoryItem(itemName, count)
            xPlayer.addMoney(itemPrice * count)
            TriggerClientEvent('ox_lib:notify', player, { type = 'success', description = ' '..KVL['Locales']['solditem']..' '..count..' '..itemLabel..' ' })
        else
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..KVL['Locales']['noitemtosell']..' ' })
        end
    end)
end

for index, item in ipairs(KVL['Buy']) do
    RegisterServerEvent('buyItems_' .. index)
    AddEventHandler('buyItems_' .. index, function(count)
        local itemIndex = index
        local player = source
        local xPlayer = ESX.GetPlayerFromId(player)

        if not KVL['Buy'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..KVL['Locales']['invaliditem']..' ' })
            return
        end

        local itemName = KVL['Buy'][itemIndex].name
        local itemLabel = KVL['Buy'][itemIndex].label
        local itemPrice = KVL['Buy'][itemIndex].price

        local totalPrice = itemPrice * count

        if xPlayer.getMoney() >= totalPrice then
            if xPlayer.canCarryItem(itemName, count) then
                xPlayer.removeMoney(totalPrice)
                xPlayer.addInventoryItem(itemName, count)
                TriggerClientEvent('ox_lib:notify', player, { type = 'success', description = ' '..KVL['Locales']['boughtitem']..' '..count..' '..itemLabel..' ' })
            else
                TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..KVL['Locales']['inventoryfull']..' ' })
            end
        else
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..KVL['Locales']['insufficientmoney']..' ' })
        end
    end)
end


