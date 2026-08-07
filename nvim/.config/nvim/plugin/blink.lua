vim.pack.add({
	{ src = "https://github.com/saghen/blink.lib" },
	{src = "https://github.com/saghen/blink.cmp"},
})

require('blink.cmp').download({ force = true, tags = '*' }):pwait()

require("blink.cmp").setup({
	keymap = { preset = 'super-tab' },
	completion = {
		menu = { auto_show = true },
		documentation = {auto_show = true, auto_show_delay_ms = 500 },
	},
	sources = {
		default = {"lsp", "path", "snippets", "buffer"},
	},
})
