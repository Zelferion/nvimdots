-- lua/plugins/tmux.lua

return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.api.nvim_set_keymap('n', '<M-h>', ':TmuxNavigateLeft<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<M-j>', ':TmuxNavigateDown<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<M-k>', ':TmuxNavigateUp<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<M-l>', ':TmuxNavigateRight<CR>', { silent = true })
    end,
  },  
  {
    "edkolev/tmuxline.vim",
    config = function()
      vim.g.tmuxline_preset = 'full'
      vim.g.tmuxline_theme = 'vim_statusline_3'
    end,
  },
}
