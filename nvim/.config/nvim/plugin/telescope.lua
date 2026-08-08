vim.pack.add({
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/nvim-telescope/telescope.nvim", version = "master"},
})

vim.keymap.set('n', "<leader><leader>", function () vim.schedule(function() vim.cmd("Telescope find_files") end) end, {desc = "find files dir"})
vim.keymap.set('n', "<leader>fo", function () require("telescope.builtin").oldfiles({ sorting_strategy = "ascending" }) end, {desc = "find files dir"})
vim.keymap.set('n', "<leader>fh", function () vim.schedule(function() vim.cmd("Telescope help_tags") end) end, {desc = "find files dir"})
