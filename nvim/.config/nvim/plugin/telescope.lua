vim.pack.add(
	{
		{src = "https://github.com/nvim-lua/plenary.nvim"},
		{src = "https://github.com/nvim-telescope/telescope.nvim.git"},
	})
vim.keymap.set('n', "<leader><leader>", function() vim.cmd('Telescope find_files') end, {desc = "find file in current directory"})
vim.keymap.set('n', "<leader>fg", function() vim.cmd('Telescope live_grep') end, {desc = "live grep search"})
vim.keymap.set('n', "<leader>fb", function() vim.cmd('Telescope buffers') end, {desc = "list open buffers"})
