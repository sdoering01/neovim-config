vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_completion = true
vim.g.copilot_filetypes = {
    vimwiki = false,
    markdown = false,
    text = false,
    plaintex = false,
    tex = false,
    TelescopePrompt = false,
}
