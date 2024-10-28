require("config.lazy")
require("config.keymaps")
require("config.set")
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
  ignore_certificate_errors = false,
})
vim.cmd [[
  highlight WinSeparator guifg=#1E1E2E guibg=#1E1E2E ctermfg=0 ctermbg=0
]]

