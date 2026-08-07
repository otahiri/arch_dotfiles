vim.pack.add(
	{
		{src = "https://github.com/nvim-lua/plenary.nvim"},
		{src = "https://github.com/nvim-telescope/telescope.nvim"},
	}
)

vim.keymap.set('n', "<leader><leader>", function() vim.cmd("Telescope find_files") end, {desc = "find files dir"})
