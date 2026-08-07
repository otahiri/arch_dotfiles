vim.g.mapleader = " "

vim.keymap.set('n', "<leader>e", function() Snacks.explorer() end)
vim.keymap.set('n', "<C-h>", "<C-w>h", {desc = "move to the left pane"})
vim.keymap.set('n', "<C-l>", "<C-w>l", {desc = "move to the right pane"})
vim.keymap.set('n', "<C-j>", "<C-w>j", {desc = "move to the bottom pane"})
vim.keymap.set('n', "<C-k>", "<C-w>k", {desc = "move to the top pane"})
vim.keymap.set('n', "<C-h>", "<C-w>h", {desc = "move to the left pane"})
