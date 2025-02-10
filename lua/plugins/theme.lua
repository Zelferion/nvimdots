
return {
    "Zelferion/ghostty-nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("ghostty-nvim").setup({
            enabled = true,
            treesitter = true,
            reload_keymap = "<leader>tr"  
        })
    end,
}
