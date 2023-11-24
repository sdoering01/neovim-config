-- Has to be set before loading the plugins
vim.g.mapleader = " "

require('plugins')
require('settings')
require('lsp')
require('keymaps')
require('autocommands')
