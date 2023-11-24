local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Has to be set before loading lazy
vim.g.mapleader = " "

require("lazy").setup({
    'wbthomason/packer.nvim',

    -- Telescope - a fuzzy finder
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    { 'nvim-telescope/telescope-fzy-native.nvim', config = function() require'plugins.telescope' end },
    'kyazdani42/nvim-web-devicons',

    -- Harpoon - fast navigation between files
    'nvim-lua/popup.nvim',
    { 'ThePrimeagen/harpoon', config = function() require'plugins.harpoon' end },

    -- Themes
    { 'folke/tokyonight.nvim', branch = 'main', config = function() require'plugins.tokyonight' end },

    -- Fern - a file tree plugin
    { 'lambdalisue/fern.vim', branch = 'main', config = function() require'plugins.fern' end },
    'lambdalisue/nerdfont.vim',
    {'lambdalisue/fern-renderer-nerdfont.vim', dependencies = { 'lambdalisue/fern.vim', 'lambdalisue/nerdfont.vim' } },
    {'lambdalisue/fern-git-status.vim', dependencies = { "lambdalisue/fern.vim" } },
    -- Use Fern instead of netrw when using `nvim .` for example
    {'lambdalisue/fern-hijack.vim', dependencies = { "lambdalisue/fern.vim" } },
    {'yuki-yano/fern-preview.vim', dependencies = { "lambdalisue/fern.vim" } },

    -- nvim-lspconfig - collection of common language server configurations
    'neovim/nvim-lspconfig',
    -- Provides types for proper completion of the vim global at
    -- $XDG_DATA_HOME/nvim/plugged/lua-dev.nvim/types
    'folke/lua-dev.nvim',
    -- Package manager for LSP servers, DAP servers, ...
    { "williamboman/mason.nvim", build = ":MasonUpdate", main = "mason", opts = {} },
    -- Displays loading progress for LSP servers
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                },
            },
        },
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function() require'plugins.treesitter' end },
    'nvim-treesitter/playground',

    -- Completion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- Snippets
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- lualine - Status line
    { 'nvim-lualine/lualine.nvim', config = function() require'plugins.lualine' end },

    -- 'Use treesitter to autoclose and autorename html tag'
    'windwp/nvim-ts-autotag',

    -- Go plugin for vim
    'fatih/vim-go',

    -- Elixir plugin for vim
    'elixir-editors/vim-elixir',
    { 'mhinz/vim-mix-format', config = function() require'plugins.vim-mix-format' end },

    -- Formatting plugin
    'sbdchd/neoformat',

    -- Git plugin
    { 'tpope/vim-fugitive', config = function() require'plugins.vim-fugitive' end },

    -- vim-surround - can do some nice stuff with surround text objects
    'tpope/vim-surround',

    -- Adds indentation guides to all lines (vertical line for every level of
    -- indentation)
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        opts = {
            exclude = {
                filetypes = { "help", "fern", "fugitive", "git" },
            },
        },
    },

    -- Emmet plugin - let's you generate boilerplate html easily
    { 'mattn/emmet-vim', config = function() require'plugins.emmet-vim' end },

    -- Show git changes next to the corresponding lines
    'lewis6991/gitsigns.nvim',

    -- A Vim wrapper for running tests
    { 'vim-test/vim-test', config = function() require'plugins.vim-test' end },

    -- A vsc*de inspired scrollbar
    { 'petertriho/nvim-scrollbar', config = function() require'plugins.nvim-scrollbar' end },

    -- Comment plugin
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },

    -- Personal wiki for vim
    { 'vimwiki/vimwiki', config = function() require'plugins.vimwiki' end },

    -- GitHub Copilot
    { 'github/copilot.vim', config = function() require'plugins.copilot' end },
})
