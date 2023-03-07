vim.g.vimwiki_list = {
    {
        syntax = 'markdown',
        ext = '.md',
        auto_diary_index = 1,
    },
}
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_global_ext = 0

local vimwiki_augroup = vim.api.nvim_create_augroup('vimwiki_settings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'vimwiki',
    group = vimwiki_augroup,
    command = 'setlocal spell spelllang=en_us,de'
})
