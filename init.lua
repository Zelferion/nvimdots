require("config.lazy")
require("config.keymaps")
require("config.set")

-- Force laststatus=0 on startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.opt.laststatus = 0
  end,
})

vim.opt.fillchars:append({ eob = ' ' })

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.zig",
    callback = function()
        vim.bo.filetype = "zig"
    end
})

vim.cmd[[ colorscheme theme ]]

vim.opt.laststatus = 0
vim.opt.showtabline = 0

vim.cmd[[ set laststatus=0]]

-- Force laststatus=0 on startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.opt.laststatus = 0
  end,
})
