vim.g["fern#renderer"] = "nerdfont"

local fern_settings = function()
    vim.keymap.set('n', 'p', '<Plug>(fern-action-preview:toggle)', { buffer = true })
    vim.keymap.set('n', '<C-p>', '<Plug>(fern-action-preview:auto:toggle', { buffer = true })
    vim.keymap.set('n', '<C-d>', '<Plug>(fern-action-preview:scroll:down:half', { buffer = true })
    vim.keymap.set('n', '<C-u>', '<Plug>(fern-action-preview:scroll:up:half', { buffer = true })
    -- Not using trashcli so remap D to remove
    vim.keymap.set('n', 'D', '<Plug>(fern-action-remove)', { buffer = true })

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.colorcolumn = ''
end

local fern_augroup = vim.api.nvim_create_augroup('fern_settings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'fern',
    group = fern_augroup,
    callback = fern_settings,
})

vim.keymap.set('n', '<leader>f', ':Fern . -drawer -toggle -width=40 -reveal=%<CR>', { silent = true })
