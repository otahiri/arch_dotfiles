vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "bashls", "pyright", "rust_analyzer", "qmlls"},
})
