KVL = {}


KVL['Sell'] = {
    {label = "Bag", name = "bag", price = 200},
    {label = "Hack USB", name = "hackusb", price = 300},
    {label = "Hack Laptop", name = "hacklaptop", price = 300},
}

KVL['Buy'] = {
    {label = "Whiskey", name = "whiskey", price = 200},
    {label = "Tequila", name = "tequila", price = 300},
    {label = "Vodka", name = "vodka", price = 300},
}


KVL['Coords'] = {
    Buyers = {
        ['frank'] = {
            coords = vec3(-41.4577, -227.752, 46.10),
        },
        -- ['mark'] = {
        --     coords = vec3(416.9166, -966.447, 29.445),                   -- If you want to activate a 2nd receiver, you can arrange them with the same logic.
        -- } 
    },
    Dealers = {
        ['frank'] = {
            coords = vec3(-44.8020, -231.289, 45.799),
        },
        -- ['mark'] = {
        --     coords = vec3(416.9166, -966.447, 29.445),                   -- If you want to activate a 2nd receiver, you can arrange them with the same logic.
        -- } 
    },
}

KVL.Peds = { -- if you want add new peds create here
    buyers1 = {ped = 0x6BD9B68C, anim = "WORLD_HUMAN_CLIPBOARD", x = -41.4577, y = -227.752, z = 45.799, h = 72.261901855469},   -- 1 NPC
    
    
    
    
    dealers1 = {ped = 0xE7565327, anim = "WORLD_HUMAN_CLIPBOARD", x = -44.8020, y = -231.289, z = 45.799, h = 74.119964599609}, -- If you want to activate a 2nd npc, you can arrange them with the same logic.  
}

KVL['Locales'] = {
    ['invaliditem'] = 'You have selected an invalid item',
    ['solditem'] = 'You selled this item amount: ',
    ['noitemtosell'] = 'You need this item to do this: ',
    ['inventoryfull'] = 'Your inventory is full',
    ['boughtitem'] = 'Item purchased',
}




