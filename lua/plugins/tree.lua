return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Ensure required dependencies are loaded
    local status_ok, neo_tree = pcall(require, "neo-tree")
    if not status_ok then
      vim.notify("neo-tree.nvim not found!", vim.log.levels.ERROR)
      return
    end

    -- Create autocommand group for better management
    local augroup = vim.api.nvim_create_augroup("NeoTreeConfig", { clear = true })

    -- Hide cursor line in neo-tree window
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "neo-tree",
      callback = function()
        vim.opt_local.cursorline = false
      end,
    })

    -- Define highlights in a protected call
    local function set_highlights()
      local bg_color = "#1e1e2e"
      local fg_color = "#ded6ff"
      local inactive_fg = "#c9c9c9"
      
      local highlights = {
        NeoTreeNormal = { bg = bg_color, fg = fg_color },
        NeoTreeNormalNC = { bg = bg_color, fg = inactive_fg },
        NeoTreeStatusLine = { bg = bg_color, fg = fg_color },
        NeoTreeStatusLineNC = { bg = bg_color, fg = inactive_fg },
        NeoTreeTabActive = { bg = bg_color, fg = fg_color, bold = true },
        NeoTreeTabInactive = { bg = bg_color, fg = inactive_fg },
        NeoTreeTabSeparatorActive = { bg = bg_color, fg = fg_color },
        NeoTreeTabSeparatorInactive = { bg = bg_color, fg = inactive_fg },
        NeoTreeModified = { fg = "#f9e2af" },
        NeoTreeFileName = { bg = bg_color },
        NeoTreeFileIcon = { bg = bg_color },
        NeoTreeFloatBorder = { bg = bg_color },
        NeoTreeFloatTitle = { bg = bg_color },
        NeoTreeTitleBar = { bg = bg_color },
      }

      for group, colors in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, colors)
      end
    end

    -- Set up highlights safely
    pcall(set_highlights)

    -- Set up keymaps with descriptive opts
    local keymap_opts = {
      silent = true,
      noremap = true,
      desc = "Toggle Neo-tree",
    }
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', keymap_opts)
    
    keymap_opts.desc = "Focus Neo-tree"
    vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<CR>', keymap_opts)

    neo_tree.setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      use_default_mappings = true,
      
      window = {
        position = "left",
        width = 35,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      
      default_component_configs = {
        indent = {
          padding = 0,
          with_markers = true,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "",
            renamed   = "",
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          },
        },
        modified = {
          symbol = "●",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
      },
      
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            "node_modules"
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        bind_to_cwd = true,
      },
      
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem", display_name = " Files " },
          { source = "buffers", display_name = " Buffers " },
          { source = "git_status", display_name = " Git " },
        },
        content_layout = "start",
        tabs_layout = "equal",
        truncation_character = "…",
        padding = 0,
        separator = { left = "▏", right = "" },
        show_separator_on_edge = false,
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
      },
      
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- Reset any buffer-local options that might interfere
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
          end
        },
      },
    })
  end,
}
