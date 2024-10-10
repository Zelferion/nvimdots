return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = {
          theme = {
              normal = {
                  a = { fg = '#ded6ff', bg = '#4d3cc9' }, -- Latte
                  b = { fg = '#ded6ff', bg = '#4d3cc9' },
                  c = { fg = '#ded6ff', bg = '#1e1e2e' }, -- Dark background
              },
              insert = { a = { fg = '#ded6ff', bg = '#a6e3a1' } }, -- Macchiato
              visual = { a = { fg = '#ded6ff', bg = '#f9e2af' } }, -- Frappe
              replace = { a = { fg = '#ded6ff', bg = '#f28fbd' } }, -- Mocha
              command = { a = { fg = '#ded6ff', bg = '#4d3cc9' } }, -- Latte
              inactive = {
                  a = { fg = '#c9c9c9', bg = '#1e1e2e' },
                  b = { fg = '#c9c9c9', bg = '#1e1e2e' },
                  c = { fg = '#c9c9c9', bg = '#1e1e2e' },
              },
          },
        section_separators = '',
        component_separators = '',
        icons_enabled = true,
        globalstatus = true,
      },
      tabline = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename .. "    "'},
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

