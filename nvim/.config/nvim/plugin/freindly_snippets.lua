vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets"},
})
vim.pack.add({
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = vim.version.range("2.*"),
	},

})


require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").setup()
