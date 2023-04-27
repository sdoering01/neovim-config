require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = "all",
    -- nvim-ts-autotag plugin
    autotag = {
        enable = true,
    },
    -- nvim-treesitter-textobjects plugin
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ak"] = "@block.outer",
                ["ik"] = "@block.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
        },
    },
}
vim.treesitter.language.register("tsx", { "javascript", "typescript.tsx" })

vim.treesitter.language.register("markdown", "vimwiki")
