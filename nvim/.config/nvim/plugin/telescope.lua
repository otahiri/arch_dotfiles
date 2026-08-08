vim.pack.add({
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/nvim-telescope/telescope.nvim", version = "master"},
})

vim.keymap.set('n', "<leader><leader>", function () vim.schedule(function() vim.cmd("Telescope find_files") end) end, {desc = "find files dir"})
vim.keymap.set('n', "<leader>fo", function () require("telescope.builtin").oldfiles({ sorting_strategy = "ascending" }) end, {desc = "open old files"})
vim.keymap.set('n', "<leader>fh", function () vim.schedule(function() vim.cmd("Telescope help_tags") end) end, {desc = "find help"})
vim.keymap.set('n', "<leader>ff", function () vim.schedule(function() vim.cmd("Telescope buffers") end) end, {desc = "open current buffers"})
vim.keymap.set('n', "<leader>fg", function () vim.schedule(function() vim.cmd("Telescope live_grep") end) end, {desc = "search for word"})
vim.keymap.set('n', "<leader>fc", function() vim.schedule(function() vim.cmd("Telescope find_files cwd=" .. vim.fn.stdpath("config")) end) end, {desc = "open configs"})



