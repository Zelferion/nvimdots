return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
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
                    "ts_ls",
                    "rust_analyzer",
                },
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

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
                                        "vim",
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
                function(server_name)
                    if server_name ~= "lua_ls" then
                        lspconfig[server_name].setup({})
                    end
                end,
            })
        end,
    }
}
