return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "tsserver",
                    "rust_analyzer",
                },
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            -- Only set up gd keybinding
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

            -- Special setup for lua_ls to disable semantic tokens
            require("mason-lspconfig").setup_handlers({
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                semantic = {
                                    enable = false,
                                },
                                diagnostics = {
                                    globals = {
                                        "vim",         -- Neovim's API
                                        "assert",
                                        "bit",
                                        "debug",
                                        "io",
                                        "jit",
                                        "math",
                                        "os",
                                        "package",
                                        "string",
                                        "table",
                                        "utf8",
                                    },
                                },
                            }
                        }
                    })
                end,
                -- Default handler for other servers
                function(server_name)
                    if server_name ~= "lua_ls" then
                        lspconfig[server_name].setup({})
                    end
                end,
            })
        end,
    }
}
