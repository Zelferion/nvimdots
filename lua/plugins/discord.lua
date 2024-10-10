return {
    {
        'IogaMaster/neocord',
        event = "VeryLazy",  -- Add a comma here
        opts = {
            logo                = "auto",                     -- "auto" or url
            logo_tooltip        = nil,                        -- nil or string
            main_image          = "language",                 -- "language" or "logo"
            client_id           = "1293307716525228032",      -- Use your own Discord application client id
            log_level           = nil,                        -- Log messages at or above this level
            debounce_timeout    = 1,                         -- Number of seconds to debounce events
            blacklist           = {},                         -- A list of strings or patterns that disable Rich Presence
            file_assets         = {},                         -- Custom file asset definitions
            show_time           = true,                       -- Show the timer
            global_timer        = true,                      -- Timer behavior

            -- Rich Presence text options
            editing_text        = "Editing %s",               -- Format for editable files
            file_explorer_text  = "Browsing %s",              -- Format for file explorer
            git_commit_text     = "Committing changes",       -- Format for git commits
            plugin_manager_text  = "Managing plugins",        -- Format for managing plugins
            reading_text        = "Reading %s",               -- Format for read-only files
            workspace_text      = "Working on %s",            -- Format for git repositories
            line_number_text    = "Line %s out of %s",        -- Format for line numbers
            terminal_text       = "Using Terminal",            -- Format for terminal usage
        },
    },
}

