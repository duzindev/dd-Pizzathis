local ox = exports.ox_inventory

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    ox:RegisterStash(
        Config.StorageStash.id,
        Config.StorageStash.label,
        Config.StorageStash.slots,
        Config.StorageStash.weight,
        false
    )

    ox:RegisterStash(
        Config.CounterStash.id,
        Config.CounterStash.label,
        Config.CounterStash.slots,
        Config.CounterStash.weight,
        false
    )
end)

RegisterNetEvent("dd-pizzathis:server:buyItem", function(item, price)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    local money = player.PlayerData.money.cash
    if money < price then
        exports.qbx_core:Notify(src, "Dinheiro insuficiente.", "error")
        return
    end

    player.Functions.RemoveMoney("cash", price)
    ox:AddItem(src, item, 1)
    exports.qbx_core:Notify(src, "Item comprado.", "success")
end)

RegisterNetEvent('dd-pizzathis:server:dutyToggle', function()
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    local job = player.PlayerData.job
    if not job or job.name ~= Config.Job then
        exports.qbx_core:Notify(src, "Você não trabalha aqui.", "error")
        return
    end

    local newDuty = not job.onduty
    player.Functions.SetJobDuty(newDuty)

    local status = newDuty and "em serviço" or "fora de serviço"
    exports.qbx_core:Notify(src, "Agora você está " .. status .. ".", "primary")
end)

RegisterNetEvent("dd-pizzathis:server:makeCoffee", function()
    local src = source
    ox:AddItem(src, "coffee", 1, {
        durability = 100
    })
    exports.qbx_core:Notify(src, "Café pronto!", "success")
end)

RegisterNetEvent("dd-pizzathis:server:makeDough", function()
    local src = source
    local flourCount = ox:GetItemCount(src, 'flour')

    if flourCount < 1 then
        exports.qbx_core:Notify(src, "Você precisa de farinha para fazer a massa.", "error")
        return
    end

    ox:RemoveItem(src, 'flour', 1)
    ox:AddItem(src, 'pizzadough', 1)
    exports.qbx_core:Notify(src, "Você preparou massa de pizza.", "success")
end)

RegisterNetEvent("dd-pizzathis:server:makePizzaBase", function()
    local src = source

    local dough = ox:GetItemCount(src, 'pizzadough')
    local tomato_sauce = ox:GetItemCount(src, 'tomato_sauce')

    if dough < 1 then
        exports.qbx_core:Notify(src, "Você precisa de massa.", "error")
        return
    end

    if tomato_sauce < 1 then
        exports.qbx_core:Notify(src, "Você precisa de molho.", "error")
        return
    end

    ox:RemoveItem(src, 'pizzadough', 1)
    ox:RemoveItem(src, 'tomato_sauce', 1)
    ox:AddItem(src, 'pizzabase', 1)

    exports.qbx_core:Notify(src, "Base de pizza montada com sucesso!", "success")
end)

RegisterNetEvent("dd-pizzathis:server:finishCraft", function(recipe)
    local src = source

    if not recipe or not recipe.item or not recipe.ingredients then
        return
    end

    for item, amount in pairs(recipe.ingredients) do
        local count = ox:GetItemCount(src, item)
        if count < amount then
            exports.qbx_core:Notify(src, "Faltam ingredientes: " .. item, "error")
            return
        end
    end

    for item, amount in pairs(recipe.ingredients) do
        ox:RemoveItem(src, item, amount)
    end
    
    ox:AddItem(src, recipe.item, 1, {
        durability = 100
    })

    exports.qbx_core:Notify(src, "Receita concluída: " .. recipe.item, "success")
end)

local CONFIG_PIZZA_SLICES = {
    ["margheritatra"] = "slicemargheritatra",
    ["funghiandolives"] = "slicefunghiandolives",
    ["pizzadelacasa"] = "slicepizzadelacasa",
}

local function createItems()
    local pizzaBoxes = { "margheritatra", "funghiandolives", "pizzadelacasa" }

    for _, item in ipairs(pizzaBoxes) do
        exports.qbx_core:CreateUseableItem(item, function(source, itemData)
            TriggerClientEvent('dd-pizzathis:OpenBox', source, itemData.name)
        end)
    end

    local slices = {
        { item = "slicemargheritatra",   base = "margheritatra" },
        { item = "slicefunghiandolives", base = "funghiandolives" },
        { item = "slicepizzadelacasa",   base = "pizzadelacasa" }
    }

    for _, slice in ipairs(slices) do
        exports.qbx_core:CreateUseableItem(slice.item, function(source)
            TriggerClientEvent("client:eatPizzaThis", source, slice.base, 55)
        end)
    end
end
createItems()

RegisterNetEvent('dd-pizzathis:OpenBox', function(item)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    if not item or type(item) ~= "string" then
        return
    end

    local sliceName = CONFIG_PIZZA_SLICES[item]
    if not sliceName then
        exports.qbx_core:Notify(src, "Pizza inválida.", "error")
        return
    end
    local hasItem = ox:GetItemCount(src, item)
    if hasItem < 1 then
        exports.qbx_core:Notify(src, "Você não tem esta caixa.", "error")
        return
    end

    if ox:RemoveItem(src, item, 1) then
        if ox:AddItem(src, sliceName, 6, {
                durability = 100
            }) then
            exports.qbx_core:Notify(src, "Você abriu a caixa e pegou 6 fatias!", "success")
        else
            ox:AddItem(src, item, 1)
            exports.qbx_core:Notify(src, "Erro ao adicionar as fatias. Tente novamente.", "error")
        end
    else
        exports.qbx_core:Notify(src, "Erro ao abrir a caixa.", "error")
    end
end)

-- RegisterNetEvent("server:onFinishGlobalEat1", function(itemName, hungryAmount)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     if not Player then return end

--     if not itemName or type(itemName) ~= "string" then return end
--     if not hungryAmount or type(hungryAmount) ~= "number" then hungryAmount = 55 end

--     local hasItem = ox:GetItemCount(src, itemName)
--     if hasItem < 1 then
--         TriggerClientEvent("QBCore:Notify", src, "Você não tem este item.", "error")
--         return
--     end

--     if ox:RemoveItem(src, itemName, 1) then
--         TriggerClientEvent('hud:client:UpdateNeeds', src, hungryAmount, false)
--         TriggerClientEvent("QBCore:Notify", src, "Você comeu uma fatia de pizza!", "success")
--     end
-- end)

-- RegisterNetEvent("dd-pizzathis:client:spawnTruck", function()
--     local model = Config.FarmTruckModel
--     local coords = Config.Stations.Blip
--     local hash = joaat(model)

--     RequestModel(hash)
--     while not HasModelLoaded(hash) do
--         Wait(0)
--     end

--     local veh = CreateVehicle(hash, coords.x, coords.y, coords.z, 180.0, true, false)
--     SetVehicleOnGroundProperly(veh)
--     local net = NetworkGetNetworkIdFromEntity(veh)

--     TriggerEvent("dd-pizzathis:client:startFarmRoute", { truck = net })
-- end)



-- RegisterNetEvent("dd-pizzathis:server:addFarmItem", function(item, amount)
--     local src = source
--     if not item or not amount or amount <= 0 then return end
--     ox:AddItem(src, item, amount)
-- end)

-- RegisterNetEvent("dd-pizzathis:server:finishFarmRoute", function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     if not Player then return end

--     for _, data in ipairs(Config.FarmRoute) do
--         local count = ox:GetItemCount(src, data.item)
--         if count and count > 0 then
--             ox:RemoveItem(src, data.item, count)
--             ox:AddItem(Config.StorageStash.id, data.item, count)
--         end
--     end

--     local payType = Config.FarmPayment.type == "cash" and "cash" or "bank"
--     Player.Functions.AddMoney(payType, Config.FarmPayment.amount)

--     TriggerClientEvent("QBCore:Notify", src, "Suprimentos entregues ao depósito. Pagamento recebido.", "success")
-- end)

exports.qbx_core:CreateUseableItem("bruschetta_pomodoro", function(source, item)
    TriggerClientEvent("consumables:client:EatPizza", source, item.name, 25, 3)
end)

exports.qbx_core:CreateUseableItem("focaccia_casa", function(source, item)
    TriggerClientEvent("consumables:client:EatPizza", source, item.name, 30, 5)
end)

exports.qbx_core:CreateUseableItem("salada_caprese", function(source, item)
    TriggerClientEvent("consumables:client:EatPizza", source, item.name, 20, 8)
end)

exports.qbx_core:CreateUseableItem("spaghettialpomodoro", function(source, item)
    TriggerClientEvent("consumables:client:EatPizza", source, item.name, 50, 10)
end)

exports.qbx_core:CreateUseableItem("pennealacarne", function(source, item)
    TriggerClientEvent("consumables:client:EatPizza", source, item.name, 55, 10)
end)

RegisterNetEvent('consumables:server:removeItem', function(itemName, amount)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    if ox:RemoveItem(src, itemName, amount or 1) then
    end
end)
