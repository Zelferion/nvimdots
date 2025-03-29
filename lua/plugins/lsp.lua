return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",          -- Completion plugin
            "hrsh7th/cmp-nvim-lsp",      -- LSP source for nvim-cmp
            "L3MON4D3/LuaSnip",          -- Snippet engine
            "saadparwaiz1/cmp_luasnip",  -- Snippet completions
        },
        config = function()
            -- Mason setup
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "gopls", "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            local cmp = require("cmp")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Setup LSP servers
            require("mason-lspconfig").setup_handlers({
                function(server)
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,
            })

            -- Completion setup
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
            })
        end,
    },
}

