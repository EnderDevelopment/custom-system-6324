fx_version 'cerulean'
game 'gta5'

description 'Custom System'
version '1.0.0'

author 'EnderDevelopment'

dependency 'qb-core'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

shared_scripts {
    'config.lua'
}