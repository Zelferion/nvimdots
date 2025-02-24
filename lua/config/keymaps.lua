vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })



vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-c>", vim.cmd.q)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.api.nvim_set_keymap('n', '<C-Up>',    '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>',  '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>',  '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-S-Up>', '<cmd>resize +2<CR>', opts)
vim.keymap.set('n', '<A-S-Down>', '<cmd>resize -2<CR>', opts)
vim.keymap.set('n', '<A-S-Right>', '<cmd>vertical resize +2<CR>', opts)
vim.keymap.set('n', '<A-S-Left>', '<cmd>vertical resize -2<CR>', opts)local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-L>", function() harpoon:list():next() end)

vim.cmd[[highlight WinSeparator guifg=NONE ctermfg=NONE]]

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})

vim.api.nvim_create_user_command('RestartLSP', function()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
    vim.cmd('edit')
end, {})

vim.api.nvim_create_user_command('GoUpdateWorkspace', function()
    vim.lsp.buf.execute_command({
        command = "_typescript.applyWorkspaceEdit",
        arguments = {
            {
                documentChanges = {
                    {
                        textDocument = {
                            uri = vim.uri_from_bufnr(0),
                            version = nil
                        },
                        edits = {}
                    }
                }
            }
        }
    })
end, {})

-- Keybindings for custom commands
vim.keymap.set('n', '<leader>rl', ':RestartLSP<CR>', opts)
vim.keymap.set('n', '<leader>uw', ':GoUpdateWorkspace<CR>', opts)
