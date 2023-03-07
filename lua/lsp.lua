local mapper = function(mode, key, result)
    vim.keymap.set(mode, key, result, { silent = true, buffer = true })
end

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<s-tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Diagnostic config
vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    severity_sort = true,
})

--- @diagnostic disable-next-line: unused-local
local custom_attach = function(client, bufnr)
    -- Make new signcolumn for gitsigns plugin
    vim.opt.signcolumn = "yes:2"
    require('gitsigns').setup({
        keymaps = {}
    })

    mapper('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    mapper('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
    mapper('n', '<C-j>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
    mapper('n', '<C-k>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
    mapper('n', '<space>ldg', '<Cmd>lua vim.diagnostic.open_float()<CR>')
    mapper('n', '<space>lrr', '<Cmd>lua vim.lsp.buf.rename()<CR>')
    mapper('n', '<space>lca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
    mapper('n', '<space>lf', '<Cmd>lua vim.lsp.buf.format({async = true})<CR>')
    mapper('n', '<space>lrf', '<Cmd>lua vim.lsp.buf.references()<CR>')
end

local lsp = require('lspconfig')

-- Typescript
-- npm i -g typescript typescript-language-server
lsp.tsserver.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    root_dir = lsp.util.root_pattern("package.json"),
}

-- Python
-- pip install 'python-lsp-server[all]'
lsp.pylsp.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- TailwindCSS
-- npm i -g @tailwindcss/language-server
lsp.tailwindcss.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- Svelte
-- npm i -g svelte-language-server
lsp.svelte.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- Go
-- https://github.com/golang/tools/tree/master/gopls#installation
-- GO111MODULE=on go get golang.org/x/tools/gopls@latest
lsp.gopls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- Elixir
-- elixir-ls from AUR
lsp.elixirls.setup {
    cmd = {"elixir-ls"},
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- Bash
-- pacman -S bash-language-server
lsp.bashls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- Rust
-- pacman -S rust-analyzer
lsp.rust_analyzer.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- C and C++
-- pacman -S clang
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = 'utf-8'
lsp.clangd.setup {
    -- (This is for the commented out capabilities) This is required or else a warning will be emitted at every lsp action
    capabilities = capabilities,
    on_attach = custom_attach
}

-- Java
-- AUR package doesn't work, compile yourself:
-- https://github.com/georgewfraser/java-language-server
lsp.java_language_server.setup {
    cmd = {"/opt/java-language-server/dist/lang_server_linux.sh"},
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- CSS
-- npm i -g vscode-langservers-extracted
lsp.cssls.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
}

-- Deno
lsp.denols.setup {
    on_attach = custom_attach,
    capabilities = capabilities,
    root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
    deno = {
        enable = true,
        suggest = {
            imports = {
                hosts = {
                    ["https://crux.land"] = true,
                    ["https://deno.land"] = true,
                    ["https://x.nest.land"] = true,
                },
            },
        },
    },
}

-- Lua
-- pacman -S lua-language-server
local lua_ls_root_path = os.getenv("HOME") .. "/Downloads/lua-language-server"
local lua_ls_binary = lua_ls_root_path .. "/bin/Linux/lua-language-server"

lsp.lua_ls.setup {
    on_attach = custom_attach,
    cmd = {lua_ls_binary, "-E", lua_ls_root_path .. "/main.lua"},
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    -- From plugin lua-dev.nvim to provide completion for
                    -- global vim variable
                    [vim.fn.expand('$XDG_DATA_HOME/nvim/plugged/lua-dev.nvim/types')] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}
--local luadev = require("lua-dev").setup({
--    lspconfig = {
--        cmd = {"lua-language-server"},
--        on_attach = custom_attach
--    }
--})
--lsp.lua_ls.setup(luadev)
