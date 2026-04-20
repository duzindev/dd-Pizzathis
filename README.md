# 🍕 dd-pizzathis

Script completo de pizzaria italiana para servidores FiveM, com sistema de crafting por estações, cardápio interativo, sistema de serviço e integração com os principais frameworks.

---

## Sobre

O **dd-pizzathis** simula o funcionamento real de uma pizzaria dentro do GTA V. Funcionários entram em serviço, preparam ingredientes em estações específicas, montam pizzas e as servem aos clientes. Clientes podem comprar bebidas diretamente no freezer e visualizar o cardápio em um menu interativo.

---

## Funcionalidades

- Sistema de crafting por estações (massa, corte, montagem, forno, sobremesas, entradas, café)
- Cardápio visual interativo (NUI)
- Freezer de bebidas com compra direta
- Balcão e depósito com stash via ox_inventory
- Sistema de entrada/saída de serviço
- Cobrança de clientes via jim-payments
- Blip configurável no mapa
- Animações em cada ação de crafting

---

## Dependências

| Recurso | Link |
|---|---|
| qbx_core | https://github.com/Qbox-project/qbx_core |
| ox_inventory | https://github.com/overextended/ox_inventory |
| ox_target | https://github.com/overextended/ox_target |
| ox_lib | https://github.com/overextended/ox_lib |
| jim-payments | https://github.com/jimathy/jim-payments |

---

## Estações de trabalho

| Estação | Ação |
|---|---|
| Balcão | Stash público para pedidos |
| Depósito | Stash restrito a funcionários |
| Mesa de Corte | Preparar ingredientes |
| Preparação de Massa | Fazer massa de pizza |
| Montagem | Montar base de pizza |
| Forno de Pizza | Assar pizzas completas |
| Fogão | Pratos quentes e massas |
| Entradas | Bruschetta, focaccia e caprese |
| Sobremesas | Tiramisu, gelato e frutas frescas |
| Café | Preparar café |
| Freezer de Bebidas | Venda direta ao cliente |
| Ponto de Serviço | Entrar/sair de serviço |

---

## Cardápio

**Pizzas**
- Pizza Margherita Tradicional
- Pizza Funghi e Olive
- Pizza della Casa

**Massas**
- Spaghetti al Pomodoro
- Penne alla Carne

**Entradas**
- Bruschetta al Pomodoro
- Focaccia da Casa
- Salada Caprese Rústica

**Sobremesas**
- Tiramisu Tradicional
- Gelato Italiano de Chocolate
- Frutas Frescas da Estação

**Bebidas**
- Refrigerante Italiano
- Água Mineral Com Gás
- Suco Natural de Laranja
- Chop Claro
- Vinho Dolceto
- Vinho Tinto da Casa
- Vinho Branco da Casa

---

## Instalação

Consulte o arquivo [INSTALL.md](./INSTALL.md) para instruções detalhadas de instalação, lista de itens e configuração do job.

---

## Configuração

Todas as opções ficam em `config.lua`:

```lua
Config.Job = 'pizzathis'         -- nome do job
Config.Stations = { ... }        -- coordenadas das estações
Config.Shops.Drinks = { ... }    -- bebidas e preços
Config.Craft = { ... }           -- receitas por estação
Config.StorageStash = { ... }    -- configuração do depósito
Config.CounterStash = { ... }    -- configuração do balcão
```

---

## Licença

Este projeto está licenciado sob a [GPL-3.0-1](./LICENSE).

---

## Créditos

Desenvolvido por **DuDu** — script de uso livre para servidores FiveM.
