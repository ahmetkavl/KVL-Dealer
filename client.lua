ESX = exports["es_extended"]:getSharedObject()



RegisterNetEvent('openBuyerMenu')
AddEventHandler('openBuyerMenu', function(items)
    local options = {}

    for index, item in ipairs(KVL['Sell']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItemss_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'sellmenu',
        title = 'Selling Menu',
        options = options
    })

    lib.showContext('sellmenu')
end)

for index, item in ipairs(KVL['Sell']) do
    RegisterNetEvent('sellItemss_' .. index)
    AddEventHandler('sellItemss_' .. index, function()
        local itemIndex = index
        local input = lib.inputDialog('How many do you want to sell?', {'Enter quantity'})
        if not input then return end
        local count = tonumber(input[1])
        if count > 0 then
            TriggerServerEvent('sellItems_' .. index, count)
        end
    end)
end

RegisterNetEvent('openSellersMenu')
AddEventHandler('openSellersMenu', function(items)
    local options = {}

    for index, item in ipairs(KVL['Buy']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'buyItemss_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'sellmenu',
        title = 'Buying Menu',
        options = options
    })

    lib.showContext('sellmenu')
end)

for index, item in ipairs(KVL['Buy']) do
    RegisterNetEvent('buyItemss_' .. index)
    AddEventHandler('buyItemss_' .. index, function()
        local itemIndex = index
        local input = lib.inputDialog('How many do you want to buy?', {'Enter quantity'})
        if not input then return end
        local count = tonumber(input[1])
        if count > 0 then
            TriggerServerEvent('buyItems_' .. index, count)
        end
    end)
end



local ox_target = exports.ox_target
local ox_inventory = exports.ox_inventory

for k, v in pairs(KVL['Coords'].Buyers) do
    ox_target:addSphereZone({
        name = 'Buyers' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openBuyerMenu',
                label = 'Talk to Buyer',
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

for k, v in pairs(KVL['Coords'].Dealers) do
    ox_target:addSphereZone({
        name = 'Sellers' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openSellersMenu',
                label = 'Talk to Seller',
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

Citizen.CreateThread(function()
    for k,v in pairs(KVL['Coords'].Buyers) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        stanley = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, v.npc.anim, 0, true);
        
    end

    for k,v in pairs(KVL['Coords'].Dealers) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        stanley = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, v.npc.anim, 0, true);
        
    end

end)









