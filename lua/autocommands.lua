local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup('sdoering01', { clear = true })

autocmd('FileType', { pattern = 'plaintex', group = augroup, command = 'setlocal spell spelllang=en_us' })
autocmd('FileType', { pattern = 'gitcommit', group = augroup, command = 'setlocal spell spelllang=en_us' })
autocmd('TextYankPost', { group = augroup, callback = function() vim.highlight.on_yank({ timeout = 100 }) end })
-- Does not work when running the cmd outside of autocmds
autocmd('VimEnter', { group = augroup, command = 'vnoremap S :s//g<Left><Left>' })
