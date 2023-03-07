local telescope = require'telescope'

telescope.setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons = true,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

telescope.load_extension('fzy_native')

vim.keymap.set('n', '<leader>pf', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>ps', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>pgs', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>pgb', ':Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>prf', function() require'telescope.builtin'.lsp_references() end)
