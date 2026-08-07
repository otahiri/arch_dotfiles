vim.pack.add({"https://github.com/folke/snacks.nvim.git"})
vim.keymap.set('n', "<leader>e", function() Snacks.explorer() end, {desc = "open file explorer"})
