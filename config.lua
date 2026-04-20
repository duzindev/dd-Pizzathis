Config = {}

Config.Job = 'pizzathis'

Config.Stations = {
    Blip = vec3(-1348.916, -1066.683, 7.3901586),

    Counter = vec3(-1345.031, -1065.14, 7.1259822),
    Storage = vec3(-1339.912, -1059.105, 7.3520703),

    FreezerDrinks = vec3(-1347.574, -1063.296, 7.3876719),
    Deserts = vec3(-1343.495, -1060.758, 7.2854094),
    FreezerSupplies = vec3(-1343.526, -1060.951, 6.9180712),

    Dough = vec3(-1339.765, -1062.754, 6.7727417),
    Pasta = vec3(-1338.37, -1061.875, 6.7825584),
    Cut = vec3(-1336.641, -1060.974, 6.7698783),
    Entradas = vec3(-1337.636, -1061.294, 7.0907797),
    Assemble = vec3(-1337.015, -1059.045, 6.8294744),
    Oven = vec3(-1341.161, -1060.323, 6.9278478),

    Duty = vec3(-1344.774, -1061.724, 7.1187148),
    Coffee = vec3(-1346.096, -1062.769, 7.7535719)
}

Config.Blip = {
    coords = vec3(-1346.18, -1071.161, 7.3907232),
    sprite = 267,
    scale = 0.85,
    color = 1,
    label = "Pizzaria Bella Roma"
}

Config.StorageStash = {
    id = 'pizza_storage',
    label = 'Depósito da Pizzaria',
    slots = 100,
    weight = 400000
}

Config.CounterStash = {
    id = 'pizza_counter',
    label = 'Balcão da Pizzaria',
    slots = 25,
    weight = 100000
}

Config.ManagerGroups = {
    pizzathis = true
}

-- Config.Farm = {
--     StartRoute = vec3(-1348.916, -1066.683, 7.3901586),
--     TruckSpawn = vec3(-1336.711, -1099.684, 6.4354929),
--     TruckHeading = 220.0,
--     FinishRoute = vec3(-1336.711, -1099.684, 6.4354929),
-- }


-- Config.FarmTruckModel = 'speedo'
-- Config.FarmPayment = {
--     type = 'bank',
--     amount = 150
-- }

-- Config.FarmRoute = {
--     { coords = vec3(120.55, -1039.12, 29.40), item = 'flour', amount = 8 },
--     { coords = vec3(-47.22, -1755.12, 29.42), item = 'tomato', amount = 10 },
--     { coords = vec3(1163.91, -323.67, 69.21), item = 'cheese_block', amount = 6 },
--     { coords = vec3(25.78, -1347.30, 29.50), item = 'water', amount = 12 },
--     { coords = vec3(-711.44, -915.21, 19.21), item = 'egg', amount = 10 }
-- }

-- Config.SupplierTruck = {
--     model = 'speedo',
--     deliveries = {
--         sauce = 20,
--         pasta = 20,
--         olives = 20,
--         basil = 20,
--         mozz = 20,
--         lettuce = 20,
--         pizzmushrooms = 20,
--         meat = 20,
--         squid = 20
--     }
-- }

Config.Shops = {
    Drinks = {
        -- { name = "vodka",         label = "Vodka",                 price = 1850 },
        -- { name = "sprunk",        label = "Sprunk",                price = 240 },
        { name = "italiansoda",   label = "Refrigerante Italiano",   price = 10 },
        { name = "water_bottleg", label = "Agua Mineral Com Gas",    price = 10 },
        { name = "orangejuice",   label = "Suco Natural de laranja", price = 10 },
        { name = "chopp_p",       label = "Chop Claro",              price = 10 },

        -- { name = "amarone",       label = "Vinho Amarone",         price = 200 },
        -- { name = "barbera",       label = "Vinho Barbera",         price = 400 },
        { name = "dolceto",       label = "Vinho Dolceto",           price = 20 },
        { name = "housered",      label = "Vinho Tinto da Casa",     price = 20 },
        { name = "housewhite",    label = "Vinho Branco da Casa",    price = 20 },
        -- { name = "rosso",         label = "Vinho Rosso",           price = 2000 },
    },

    -- Supplies = {
    --     { name = "sauce",         label = "Molho",                price = 420 },
    --     { name = "flour",         label = "Farinha",              price = 180 },
    --     { name = "pasta",         label = "Massa (Pasta)",        price = 420 },
    --     { name = "olives",        label = "Azeitonas",            price = 250 },
    --     { name = "basil",         label = "Manjericão",           price = 320 },
    --     { name = "mozz",          label = "Mozzarella",           price = 200 },
    --     { name = "lettuce",       label = "Alface",               price = 450 },
    --     { name = "pizzmushrooms", label = "Cogumelos",            price = 520 },
    --     { name = "tiramisu",      label = "Tiramisu",             price = 280 },
    --     { name = "gelato",        label = "Gelato",               price = 260 },
    --     { name = "medfruits",     label = "Frutas Mediterrâneas", price = 300 },
    --     { name = "pizzadough",    label = "Massa de Pizza",      price = 150 },
    --     { name = "meat",          label = "Carne",                price = 420 },
    --     { name = "squid",         label = "Lula",                 price = 460 },
    -- }
}

Config.Craft = {
    Base = {
        { item = 'pizzabase', ingredients = { pizzadough = 1, sauce = 1 } }
    },

    ChoppingBoard = {
        {
            item = 'strips_meat',
            label = 'Tiras de Carne',
            ingredients = { pig_meat = 1 }
        },

        {
            item = 'fresh_basil',
            label = 'Manjericão Fresco',
            ingredients = { basil = 1 }
        },
        {
            item = 'herb_mix',
            label = 'Mix de Ervas',
            ingredients = { basil = 1, spice_mix = 1 }
        },
        {
            item = 'tomato_sauce',
            label = 'Molho de Tomate',
            ingredients = { basil = 1, tomato = 1 }
        },
        -- { item = 'ham',    ingredients = { meat = 1 } }
    },

    Oven = {
        {
            item = 'spaghettialpomodoro',
            label = 'Spaghetti al Pomodoro',
            ingredients = { pasta = 1, tomato_sauce = 1, herb_mix = 1, fresh_basil = 1 }
        },
        {
            item = 'pennealacarne',
            label = 'Penne alla Carne',
            ingredients = { pasta = 1, tomato_sauce = 1, strips_meat = 1, herb_mix = 1 }
        },
        -- { item = 'meatball',  ingredients = { meat = 1, pasta = 1 } },
        -- { item = 'bolognese', ingredients = { meat = 1, sauce = 1 } },
        -- { item = 'calamari',  ingredients = { squid = 1, sauce = 1 } },
        -- { item = 'meatball',  ingredients = { meat = 1, pasta = 1 } },
        -- { item = 'alla',      ingredients = { ham = 1, pasta = 1, vodka = 1 } },
        -- { item = 'pescatore', ingredients = { squid = 1 } }
    },

    PizzaOven = {
        {
            item = 'margheritatra',
            label = 'Pizza Margherita Tradicional',
            ingredients = { pizzabase = 1, tomato_sauce = 1, mozz = 1, fresh_basil = 1 }
        },
        {
            item = 'funghiandolives',
            label = 'Pizza Funghi e Olive',
            ingredients = { pizzabase = 1, olives = 1, tomato_sauce = 1, mozz = 1, pizzmushrooms = 1 }
        },
        {
            item = 'pizzadelacasa',
            label = 'Pizza della Casa',
            ingredients = { pizzabase = 1, tomato_sauce = 1, mozz = 1, herb_mix = 1 }
        },
        -- { item = 'margheritabox', ingredients = { pizzabase = 1, mozz = 1 } },
        -- { item = 'marinarabox', ingredients = { pizzabase = 1, basil = 1 } },
        -- { item = 'prosciuttiobox', ingredients = { pizzabase = 1, mozz = 1, ham = 1, pizzmushrooms = 1 } },
        -- { item = 'diavolabox', ingredients = { pizzabase = 1, mozz = 1, salami = 1, basil = 1 } },
        -- { item = 'capricciosabox', ingredients = { pizzabase = 1, ham = 1, pizzmushrooms = 1, olives = 1 } },
        -- { item = 'vegetarianabox', ingredients = { pizzabase = 1, mozz = 1, lettuce = 1, basil = 1 } }
    }
}

Config.Craft.Entradas = {
    {
        item = 'bruschetta_pomodoro',
        label = 'Bruschetta al Pomodoro',
        ingredients = { italian_bread = 1, tomato = 1, olive_oil = 1, basil = 1 }
    },
    {
        item = 'focaccia_casa',
        label = 'Focaccia da Casa',
        ingredients = { italian_bread = 1, olive_oil = 1, basil = 1 }
    },
    {
        item = 'salada_caprese',
        label = 'Salada Caprese Rústica',
        ingredients = { tomato = 2, mozz = 1, basil = 1 }
    }
}

Config.Craft.Desserts = {
    {
        item = 'tiramisu',
        label = 'Tiramisu Tradicional',
        ingredients = { jimeggs = 1, cheese_m = 1, coffee = 1, snikkel_candy = 1, cookie = 1 }
    },
    {
        item = 'gelato',
        label = 'Gelato Italiano de Chocolate',
        ingredients = { milk_bottle = 1, sugar = 1, icecreamingred = 1, topping_choice = 1 }
    },
    {
        item = 'fresh_fruits',
        label = 'Frutas Frescas da estação',
        ingredients = { strawberry = 1, blueberry = 1, orange = 1, fermented_honey = 1 }
    }
}
