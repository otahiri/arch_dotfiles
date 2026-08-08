vim.pack.add({
	{src = "https://github.com/stevearc/conform.nvim"},
})
require("conform").setup({
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "x" },
			desc = "Format Injected Langs",
		},
	},
	formatters_by_ft = {
		c = { "c_formatter_42" },
		h = { "c_formatter_42" },
		cpp = { "c_formatter_42" },
		hpp = { "c_formatter_42" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
	},
})
