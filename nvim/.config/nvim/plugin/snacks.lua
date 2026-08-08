vim.pack.add({
	{src = "https://github.com/folke/snacks.nvim.git"},
})

require('mini.icons').setup()

require("snacks").setup({
	dashboard = {
		enabled = true,
		preset = {
			keys = {
				{ icon = " ", key = "f", desc = "Find File", action = function() vim.schedule(function() vim.cmd("Telescope find_files") end) end },
				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
				{ icon = " ", key = "g", desc = "Find Text", action = function() vim.schedule(function() vim.cmd("Telescope live_grep") end) end },
				{ icon = " ", key = "r", desc = "Recent Files", action = function() require("telescope.builtin").oldfiles({ sorting_strategy = "ascending" }) end },
				{ icon = " ", key = "c", desc = "Config", action = function() vim.schedule(function() vim.cmd("Telescope find_files cwd=" .. vim.fn.stdpath("config")) end) end },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },

			},
		},
		sections = {
			{section = "header"},
			{section = "keys", gap = 1, padding = 1},
		}
	},
	bigfile = { enabled = true },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})

vim.keymap.set('n', "<leader>e", function() Snacks.explorer() end, {desc = "open file explorer"})
