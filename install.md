# Instalação — dd-pizzathis

Script de pizzaria italiana para FiveM com sistema completo de crafting, estações de trabalho e cardápio interativo.

---

## Dependências

Antes de instalar, certifique-se de que os recursos abaixo estão instalados e funcionando no seu servidor:

- [qbx_core](https://github.com/Qbox-project/qbx_core)
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_target](https://github.com/overextended/ox_target)
- [ox_lib](https://github.com/overextended/ox_lib)
- [jim-payments](https://github.com/jimathy/jim-payments) — para cobrança de clientes

---

## Instalação

**1. Baixe o recurso**

Copie a pasta `dd-pizzathis` para o diretório de recursos do seu servidor:

```
resources/
└── [scripts]/
    └── dd-pizzathis/
```

**2. Registre no server.cfg**

Adicione a linha abaixo no seu `server.cfg`, após as dependências:

```
ensure dd-pizzathis
```

**3. Adicione os itens ao ox_inventory**

No arquivo `data/items.lua` do `ox_inventory`, registre os itens abaixo:

```lua
-- Ingredientes base
['flour']            = { label = 'Farinha',               weight = 200,  stack = true },
['basil']            = { label = 'Manjericão',             weight = 100,  stack = true },
['tomato']           = { label = 'Tomate',                 weight = 200,  stack = true },
['mozz']             = { label = 'Mozzarella',             weight = 300,  stack = true },
['olives']           = { label = 'Azeitonas',              weight = 150,  stack = true },
['pizzmushrooms']    = { label = 'Cogumelos',              weight = 150,  stack = true },
['pasta']            = { label = 'Massa (Pasta)',           weight = 300,  stack = true },
['pig_meat']         = { label = 'Carne de Porco',         weight = 400,  stack = true },
['olive_oil']        = { label = 'Azeite de Oliva',        weight = 200,  stack = true },
['italian_bread']    = { label = 'Pão Italiano',           weight = 200,  stack = true },
['spice_mix']        = { label = 'Mix de Especiarias',     weight = 100,  stack = true },

-- Processados
['pizzadough']       = { label = 'Massa de Pizza',         weight = 400,  stack = true },
['pizzabase']        = { label = 'Base de Pizza',          weight = 500,  stack = true },
['tomato_sauce']     = { label = 'Molho de Tomate',        weight = 200,  stack = true },
['strips_meat']      = { label = 'Tiras de Carne',         weight = 300,  stack = true },
['fresh_basil']      = { label = 'Manjericão Fresco',      weight = 100,  stack = true },
['herb_mix']         = { label = 'Mix de Ervas',           weight = 100,  stack = true },

-- Pizzas (caixas inteiras)
['margheritatra']    = { label = 'Pizza Margherita',       weight = 800,  stack = false },
['funghiandolives']  = { label = 'Pizza Funghi e Olive',   weight = 800,  stack = false },
['pizzadelacasa']    = { label = 'Pizza della Casa',       weight = 800,  stack = false },

-- Fatias
['slicemargheritatra']   = { label = 'Fatia Margherita',       weight = 150, stack = true },
['slicefunghiandolives'] = { label = 'Fatia Funghi e Olive',   weight = 150, stack = true },
['slicepizzadelacasa']   = { label = 'Fatia della Casa',       weight = 150, stack = true },

-- Massas / Pratos
['spaghettialpomodoro']  = { label = 'Spaghetti al Pomodoro',  weight = 500, stack = false },
['pennealacarne']         = { label = 'Penne alla Carne',       weight = 500, stack = false },

-- Entradas
['bruschetta_pomodoro']  = { label = 'Bruschetta al Pomodoro', weight = 200, stack = false },
['focaccia_casa']         = { label = 'Focaccia da Casa',       weight = 200, stack = false },
['salada_caprese']        = { label = 'Salada Caprese',         weight = 200, stack = false },

-- Sobremesas
['tiramisu']         = { label = 'Tiramisu',                   weight = 300, stack = false },
['gelato']           = { label = 'Gelato Italiano',            weight = 200, stack = false },
['fresh_fruits']     = { label = 'Frutas Frescas',             weight = 200, stack = false },

-- Bebidas
['italiansoda']      = { label = 'Refrigerante Italiano',      weight = 300, stack = true },
['water_bottleg']    = { label = 'Água Mineral Com Gás',       weight = 300, stack = true },
['orangejuice']      = { label = 'Suco de Laranja',            weight = 300, stack = true },
['chopp_p']          = { label = 'Chop Claro',                 weight = 400, stack = true },
['dolceto']          = { label = 'Vinho Dolceto',              weight = 500, stack = true },
['housered']         = { label = 'Vinho Tinto da Casa',        weight = 500, stack = true },
['housewhite']       = { label = 'Vinho Branco da Casa',       weight = 500, stack = true },
```

**4. Adicione o emprego (job)**

Compatível com **QBCore** e **QBX**. Cole o bloco abaixo no arquivo de jobs do seu framework:

- QBCore → `qb-core/shared/jobs.lua`
- QBX → `qbx_core/shared/jobs.lua`

```lua
['pizzathis'] = {
    label = 'Pizzaria Bella Roma',
    defaultDuty = false,
    offDutyPay = false,
    grades = {
        ['0'] = { name = 'Estagiário',       payment = 50  },
        ['1'] = { name = 'Atendente',         payment = 80  },
        ['2'] = { name = 'Cozinheiro',        payment = 120 },
        ['3'] = { name = 'Chefe de Cozinha',  payment = 180 },
        ['4'] = { name = 'Gerente',           payment = 250, isboss = true },
        ['5'] = { name = 'Dono',              payment = 350, isboss = true },
    },
},
```

---

## Estações de trabalho

O script utiliza coordenadas fixas do mapa base do GTA V. As estações ficam na região da **Pizzaria Bella Roma** e incluem:

| Estação | Função |
|---|---|
| Balcão | Stash público para pedidos |
| Depósito | Stash restrito a funcionários |
| Freezer de Bebidas | Venda de bebidas ao cliente |
| Mesa de Corte | Preparar ingredientes |
| Fogão | Pratos quentes e massas |
| Montagem | Montar base de pizza |
| Forno de Pizza | Assar pizzas completas |
| Sobremesas | Preparar tiramisu, gelato e frutas |
| Entradas | Bruschetta, focaccia e caprese |
| Café | Preparar café |
| Ponto de Serviço | Entrar/sair de serviço |

---

## Configuração

Todas as configurações ficam em `config.lua`. Os principais pontos de ajuste são:

- `Config.Job` — nome do job (padrão: `pizzathis`)
- `Config.Stations` — coordenadas de cada estação
- `Config.Shops.Drinks` — bebidas disponíveis e preços
- `Config.Craft` — receitas de cada estação
- `Config.StorageStash` / `Config.CounterStash` — slots e peso dos stashes

---

## Observações

- O blip do mapa está comentado no `client.lua` por padrão. Para ativá-lo, descomente o bloco `CreateThread` no início do arquivo.
- A rota de fazenda (farm route) está comentada na config — é uma feature planejada para versões futuras.
- O script usa `qbx_core` para notificações e gerenciamento de jogadores. Não é compatível com QBCore puro sem adaptação.

---

## Suporte

Encontrou algum problema? Abra uma issue no repositório ou entre em contato com o desenvolvedor.