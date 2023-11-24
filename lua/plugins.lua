local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Telescope - a fuzzy finder
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-telescope/telescope-fzy-native.nvim', config = function() require'plugins.telescope' end }
    use 'kyazdani42/nvim-web-devicons'

    -- Harpoon - fast navigation between files
    use 'nvim-lua/popup.nvim'
    use { 'ThePrimeagen/harpoon', config = function() require'plugins.harpoon' end }

    -- Themes
    use { 'folke/tokyonight.nvim', branch = 'main', config = function() require'plugins.tokyonight' end }

    -- Fern - a file tree plugin
    use { 'lambdalisue/fern.vim', branch = 'main', config = function() require'plugins.fern' end }
    use 'lambdalisue/nerdfont.vim'
    use 'lambdalisue/fern-renderer-nerdfont.vim'
    -- Recommended by Fern
    use 'antoinemadec/FixCursorHold.nvim'
    use 'lambdalisue/fern-git-status.vim'
    -- Use Fern instead of netrw when using `nvim .` for example
    use 'lambdalisue/fern-hijack.vim'
    use 'yuki-yano/fern-preview.vim'

    -- nvim-lspconfig - collection of common language server configurations
    use 'neovim/nvim-lspconfig'
    -- Provides types for proper completion of the vim global at
    -- $XDG_DATA_HOME/nvim/plugged/lua-dev.nvim/types
    use 'folke/lua-dev.nvim'
    -- Package manager for LSP servers, DAP servers, ...
    use { "williamboman/mason.nvim", run = ":MasonUpdate", config = function() require'mason'.setup() end }
    -- Displays loading progress for LSP servers
    use { "j-hui/fidget.nvim", config = function() require'plugins.fidget' end }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require'plugins.treesitter' end }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- Snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- lualine - Status line
    use { 'nvim-lualine/lualine.nvim', config = function() require'plugins.lualine' end }

    -- 'Use treesitter to autoclose and autorename html tag'
    use 'windwp/nvim-ts-autotag'

    -- Go plugin for vim
    use 'fatih/vim-go'

    -- Elixir plugin for vim
    use 'elixir-editors/vim-elixir'
    use { 'mhinz/vim-mix-format', config = function() require'plugins.vim-mix-format' end }

    -- Formatting plugin
    use 'sbdchd/neoformat'

    -- Git plugin
    use { 'tpope/vim-fugitive', config = function() require'plugins.vim-fugitive' end }

    -- vim-surround - can do some nice stuff with surround text objects
    use 'tpope/vim-surround'

    -- Adds indentation guides to all lines (vertical line for every level of
    -- indentation)
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require'plugins.ibl' end }

    -- Emmet plugin - let's you generate boilerplate html easily
    use { 'mattn/emmet-vim', config = function() require'plugins.emmet-vim' end }

    -- Show git changes next to the corresponding lines
    use 'lewis6991/gitsigns.nvim'

    -- A Vim wrapper for running tests
    use { 'vim-test/vim-test', config = function() require'plugins.vim-test' end }

    -- A vsc*de inspired scrollbar
    use { 'petertriho/nvim-scrollbar', config = function() require'plugins.nvim-scrollbar' end }

    -- Comment plugin
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- Personal wiki for vim
    use { 'vimwiki/vimwiki', config = function() require'plugins.vimwiki' end }

    -- GitHub Copilot
    use { 'github/copilot.vim', config = function() require'plugins.copilot' end }

    -- symbols-outline -- provides an outline of symbols in the current file via LSP
    use { 'simrat39/symbols-outline.nvim', config = function() require'plugins.symbols-outline' end }

    -- Has to come after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
