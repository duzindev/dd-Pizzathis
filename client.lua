local ox = exports.ox_inventory
local stations = Config.Stations

local function LoadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(10)
        end
    end
end

local function formatIngredients(tbl)
    local text = ""
    for item, amount in pairs(tbl) do
        local data = exports.ox_inventory:Items(item)
        local label = data and data.label or item
        text = text .. string.format("%sx %s\n", amount, label)
    end
    return text
end

-- CreateThread(function()
--     local blip = AddBlipForCoord(Config.Blip.coords.x, Config.Blip.coords.y, Config.Blip.coords.z)
--     SetBlipSprite(blip, Config.Blip.sprite)
--     SetBlipScale(blip, Config.Blip.scale)
--     SetBlipColour(blip, Config.Blip.color)
--     SetBlipAsShortRange(blip, true)
--     BeginTextCommandSetBlipName('STRING')
--     AddTextComponentSubstringPlayerName(Config.Blip.label)
--     EndTextCommandSetBlipName(blip)
-- end)

exports.ox_target:addBoxZone({
    coords = vec3(-1345.031, -1065.14, 7.1259822),
    size = vec3(1.4, 0.8, 1.8),
    rotation = 30.0,
    options = {
        {
            name = 'pizza_counter',
            event = 'dd-pizzathis:client:openCounter',
            icon = 'fa-solid fa-box',
            label = 'Balcão'
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Storage,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_storage',
            event = 'dd-pizzathis:client:openStorage',
            icon = 'fa-solid fa-warehouse',
            label = 'Depósito',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.FreezerDrinks,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_freezer_drinks',
            event = 'dd-pizzathis:client:openDrinkShop',
            icon = 'fa-solid fa-wine-bottle',
            label = 'Freezer de Bebidas',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Deserts,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_desserts',
            event = 'dd-pizzathis:client:craftDesserts',
            icon = 'fa-solid fa-ice-cream',
            label = 'Preparar Sobremesas',
            groups = Config.Job
        }
    },
    distance = 2.0
})

-- exports['qb-target']:AddBoxZone('pizza_freezer_supplies', stations.FreezerSupplies, 1.0, 1.0, {
--     name = 'pizza_freezer_supplies',
--     heading = 0.0
-- },{
--     options = {
--         {
--             event = 'dd-pizzathis:client:openSuppliesShop',
--             icon = 'fa-solid fa-snowflake',
--             label = 'Freezer de Suprimentos'
--         }
--     },
--     distance = 2.0
-- })

exports.ox_target:addBoxZone({
    coords = stations.Duty,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_duty',
            event = 'dd-pizzathis:client:duty',
            icon = 'fa-solid fa-user-check',
            label = 'Entrar / Sair de Serviço',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Coffee,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_coffee',
            event = 'dd-pizzathis:client:makeCoffee',
            icon = 'fa-solid fa-mug-hot',
            label = 'Preparar Café',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Dough,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_dough',
            event = 'dd-pizzathis:client:craftDough',
            icon = 'fa-solid fa-bowl-food',
            label = 'Preparar Massa',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Cut,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_cut',
            event = 'dd-pizzathis:client:craftCut',
            icon = 'fa-solid fa-knife-kitchen',
            label = 'Cortar Ingredientes',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Entradas,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_entradas',
            event = 'dd-pizzathis:client:craftEntradas',
            icon = 'fa-solid fa-knife-kitchen',
            label = 'Entradas',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Pasta,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_pasta',
            event = 'dd-pizzathis:client:craftOven',
            icon = 'fa-solid fa-pan-food',
            label = 'Fogão / Pratos Quentes',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Assemble,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_base',
            event = 'dd-pizzathis:client:makePizzaBase',
            icon = 'fa-solid fa-bowl-food',
            label = 'Montar Pizza Base',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = stations.Oven,
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0.0,
    options = {
        {
            name = 'pizza_pizzaoven',
            event = 'dd-pizzathis:client:craftPizzaOvenMenu',
            icon = 'fa-solid fa-pizza-slice',
            label = 'Forno de Pizza',
            groups = Config.Job
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({
    coords = vec3(-1346.706, -1066.282, 7.30),
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    options = {
        {
            name = "pizza_menu",
            event = "dd-pizzathis:client:openMenuImage",
            icon = "fa-solid fa-utensils",
            label = "Ver Cardápio"
        }
    },
    distance = 2.0
})

exports.ox_target:addBoxZone({ 
        coords = nil, 
        size = vec3(0.5, 0.5, 4.0), rotation = 0,
		options = { { 
            event = "jim-payments:client:Charge", 
            icon = "fas fa-credit-card", 
            label = "Cobrar Cliente", 
            job = "pizzathis", 
			img = "<center><p><img src=https://i.imgur.com/03eA7N0.png width=100px></p>", 
            distance = 2.0 
        } 
    } 
})

RegisterNetEvent('dd-pizzathis:client:openCounter', function()
    ox:openInventory('stash', { id = Config.CounterStash.id })
end)

RegisterNetEvent('dd-pizzathis:client:openStorage', function()
    ox:openInventory('stash', { id = Config.StorageStash.id })
end)

RegisterNetEvent('dd-pizzathis:client:openDrinkShop', function()
    local options = {}
    for _, v in ipairs(Config.Shops.Drinks) do
        options[#options+1] = {
            title = v.label or v.name,
            description = "R$"..v.price,
            event = "dd-pizzathis:client:buyItem",
            args = { item = v.name, price = v.price }
        }
    end
    lib.registerContext({
        id = 'pizza_drink_shop',
        title = 'Freezer de Bebidas',
        options = options
    })
    lib.showContext('pizza_drink_shop')
end)

RegisterNetEvent('dd-pizzathis:client:craftDesserts', function()
    local menu = {}

    for _, v in ipairs(Config.Craft.Desserts) do
        menu[#menu+1] = {
            title = v.label or v.item,
            description = "Ingredientes:\n" .. formatIngredients(v.ingredients),
            event = 'dd-pizzathis:client:startCraft',
            args = v
        }
    end

    lib.registerContext({
        id = 'pizza_desserts_menu',
        title = 'Preparar Sobremesas',
        options = menu
    })
    lib.showContext('pizza_desserts_menu')
end)

-- RegisterNetEvent('dd-pizzathis:client:openSuppliesShop', function()
--     local options = {}
--     for _, v in ipairs(Config.Shops.Supplies) do
--         options[#options+1] = {
--             title = v.label or v.name,
--             description = "R$"..v.price,
--             event = "dd-pizzathis:client:buyItem",
--             args = { item = v.name, price = v.price }
--         }
--     end
--     lib.registerContext({
--         id = 'pizza_supplies_shop',
--         title = 'Freezer de Suprimentos',
--         options = options
--     })
--     lib.showContext('pizza_supplies_shop')
-- end)

RegisterNetEvent('dd-pizzathis:client:buyItem', function(data)
    TriggerServerEvent("dd-pizzathis:server:buyItem", data.item, data.price)
end)

RegisterNetEvent('dd-pizzathis:client:duty', function()
    TriggerServerEvent('dd-pizzathis:server:dutyToggle')
end)

RegisterNetEvent('dd-pizzathis:client:makeCoffee', function()
    local ok = lib.progressBar({
        duration = 3000,
        label = "Preparando café...",
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, combat = true, car = true },
        anim = { dict = "mp_ped_interaction", clip = "handshake_guy_a" }
    })
    if ok then
        TriggerServerEvent("dd-pizzathis:server:makeCoffee")
    end
end)

RegisterNetEvent('dd-pizzathis:client:craftDough', function()
    local ok = lib.progressBar({
        duration = 5000,
        label = 'Preparando massa...',
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, combat = true, car = true },
        anim = { dict = 'anim@heists@prison_heiststation@cop_reactions', clip = 'cop_b_idle' }
    })
    if ok then
        TriggerServerEvent("dd-pizzathis:server:makeDough")
    end
end)

RegisterNetEvent('dd-pizzathis:client:makePizzaBase', function()
    local ok = lib.progressBar({
        duration = 5000,
        label = 'Montando base da pizza...',
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, combat = true, car = true },
        anim = { dict = 'anim@heists@prison_heiststation@cop_reactions', clip = 'cop_b_idle' }
    })
    if ok then
        TriggerServerEvent("dd-pizzathis:server:makePizzaBase")
    end
end)

RegisterNetEvent('dd-pizzathis:client:craftCut', function()
    local menu = {}

    for _, v in ipairs(Config.Craft.ChoppingBoard) do
        menu[#menu+1] = {
            title = v.label or v.item,
            description = "Ingredientes:\n" .. formatIngredients(v.ingredients),
            event = 'dd-pizzathis:client:startCraft',
            args = v
        }
    end

    lib.registerContext({
        id = 'pizza_cut_menu',
        title = 'Cortar Ingredientes',
        options = menu
    })
    lib.showContext('pizza_cut_menu')
end)

RegisterNetEvent('dd-pizzathis:client:craftEntradas', function()
    local menu = {}

    for _, v in ipairs(Config.Craft.Entradas) do
        menu[#menu+1] = {
            title = v.label or v.item,
            description = "Ingredientes:\n" .. formatIngredients(v.ingredients),
            event = 'dd-pizzathis:client:startCraft',
            args = v
        }
    end

    lib.registerContext({
        id = 'pizza_entradas_menu',
        title = 'Entradas',
        options = menu
    })

    lib.showContext('pizza_entradas_menu')
end)


RegisterNetEvent('dd-pizzathis:client:craftOven', function()
    local menu = {}

    for _, v in ipairs(Config.Craft.Oven) do
        menu[#menu+1] = {
            title = v.label or v.item,
            description = "Ingredientes:\n" .. formatIngredients(v.ingredients),
            event = 'dd-pizzathis:client:startCraft',
            args = v
        }
    end

    lib.registerContext({
        id = 'pizza_oven_menu',
        title = 'Fogão / Pratos Quentes',
        options = menu
    })
    lib.showContext('pizza_oven_menu')
end)

RegisterNetEvent('dd-pizzathis:client:craftPizzaOvenMenu', function()
    local menu = {}

    for _, v in ipairs(Config.Craft.PizzaOven) do
        menu[#menu+1] = {
            title = v.label or v.item,
            description = "Ingredientes:\n" .. formatIngredients(v.ingredients),
            event = 'dd-pizzathis:client:startCraft',
            args = v
        }
    end

    lib.registerContext({
        id = 'pizza_pizzaoven_menu',
        title = 'Forno de Pizza',
        options = menu
    })
    lib.showContext('pizza_pizzaoven_menu')
end)

RegisterNetEvent('dd-pizzathis:client:startCraft', function(recipe)
    local ok = lib.progressBar({
        duration = 4000,
        label = "Preparando...",
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
        anim = { dict = 'anim@heists@prison_heiststation@cop_reactions', clip = 'cop_b_idle' }
    })

    if ok then
        TriggerServerEvent("dd-pizzathis:server:finishCraft", recipe)
    end
end)

RegisterNetEvent("dd-pizzathis:client:openMenuImage", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open"
    })
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent('dd-pizzathis:OpenBox', function(itemName)
    LoadAnimDict("mp_common")
    local ok = lib.progressBar({
        duration = 3000,
        label = "Abrindo caixa de pizza...",
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, combat = true, car = true },
        anim = { 
            dict = "mp_common", 
            clip = "givetake1_a" 
        }
    })
    
    if ok then
        TriggerServerEvent('dd-pizzathis:OpenBox', itemName)
    else
        TriggerEvent("QBCore:Notify", "Você cancelou.", "error")
    end
end)

local CONFIG_EAT_MODELS = {
	["margheritatra"] = "knjgh_pizzaslice5",
	["funghiandolives"] = "knjgh_pizzaslice5",
	["pizzadelacasa"] = "knjgh_pizzaslice5",

}

RegisterNetEvent("client:eatPizzaThis", function(itemName, hungryAmount)
    local modelName = CONFIG_EAT_MODELS[itemName]
    if not modelName then return end
    LoadAnimDict("mp_player_inteat@burger")
    
    if lib.progressBar({
        duration = 5000,
        label = "Comendo...",
        useWhileDead = false,
        canCancel = true,
        disable = { move = false, car = false, combat = true },
        anim = { dict = "mp_player_inteat@burger", clip = "mp_player_int_eat_burger" },
        prop = { model = modelName }
    }) then
        local sliceName = "slice" .. itemName
        TriggerServerEvent("consumables:server:removeItem", sliceName, 1)
        TriggerServerEvent("hud:server:RelieveStress", 2)
        exports.qbx_core:Notify("Você comeu uma fatia de pizza!", "success")
    else
        exports.qbx_core:Notify("Você parou de comer.", "error")
    end
end)

RegisterNetEvent('consumables:client:EatPizza', function(itemName, hunger, stress)
    LoadAnimDict("mp_player_inteat@burger")
    
    if lib.progressBar({
        duration = 5000,
        label = "Comendo...",
        useWhileDead = false,
        canCancel = true,
        disable = { move = false, car = false, combat = true },
        anim = { dict = "mp_player_inteat@burger", clip = "mp_player_int_eat_burger" }
    }) then
        TriggerServerEvent("consumables:server:removeItem", itemName, 1)
        TriggerServerEvent("hud:server:RelieveStress", stress or 2)
        exports.qbx_core:Notify("Você comeu e se sentiu melhor!", "success")
    else
        exports.qbx_core:Notify("Você parou de comer.", "error")
    end
end)

