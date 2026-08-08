vim.pack.add({
	{src = "https://github.com/danymat/neogen"},
})

require("neogen").setup({
	snippet_engine = "luasnip",
	languages = {
		python = {
			template = {
				annotation_convention = "google_docstrings",
			}
		}
	}
})

vim.keymap.set('n', "<leader>nf", function() require("neogen").generate() end, {desc = "Generate [D]ocstring" })
