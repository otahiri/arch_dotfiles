vim.pack.add({
	{src = "https://github.com/folke/snacks.nvim.git"},
})

require("snacks").setup()

vim.keymap.set('n', "<leader>e", function() Snacks.explorer() end, {desc = "open file explorer"})
