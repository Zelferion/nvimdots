return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = {
        section_separators = '',
        component_separators = '',
        icons_enabled = true,
        globalstatus = true,
      },
      tabline = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'location'},
        lualine_z = {'progress'},
      },
      sections = {},
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    }
    vim.cmd [[
    highlight StatusLine guibg=NONE guifg=NONE
    highlight WinSeparator guibg=NONE guifg=NONE
    set statusline+=\ %<\ %f%=\ %l:%c
    set laststatus=3
    ]]
  end,
}

