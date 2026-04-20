fx_version 'cerulean'
game 'gta5'

author 'DUDU'
description 'Sistema completo de pizzaria: craft, lojas.'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    --'@prism_uipack/init.lua', --Opcional, apenas se for usar o prism_uipack para o menu.
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

files {
    'html/menu.html',
    'html/cardapio.png'
}

ui_page 'html/menu.html'

