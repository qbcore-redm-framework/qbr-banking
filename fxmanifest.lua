fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'QBR-Banking'
version '1.0.0'

shared_scripts { 
	'config/config.lua',
}

server_scripts {
    'server/wrappers/business.lua',
    'server/wrappers/useraccounts.lua',
    'server/wrappers/gangs.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua',
    'client/nui.lua'
}

ui_page 'nui/index.html'

files {
    'nui/images/logo.png',
    'nui/scripting/jquery-ui.css',
    'nui/scripting/external/jquery/jquery.js',
    'nui/scripting/jquery-ui.js',
    'nui/style.css',
    'nui/index.html',
    'nui/qbr-banking.js',
}
