return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            view = "cmdline_popup", -- Moves command line to the top
        },
        popupmenu = {
            enabled = true, -- Enable the popupmenu feature
        },
        messages = {
            enabled = true, -- Show messages in the top
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
