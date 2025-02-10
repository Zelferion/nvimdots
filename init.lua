require("config.lazy")
require("config.keymaps")
require("config.set")

vim.opt.fillchars:append({ eob = ' ' })

vim.opt.laststatus = 0
vim.opt.showtabline = 0

vim.cmd[[ set laststatus=0]]
