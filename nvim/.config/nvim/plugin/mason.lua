vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

local servers = {
				clangd = {},
				pyright = {},
				rust_analyzer = {},
				qmlls = {
					cmd = { "qmlls6" },
					filetypes = { "qml", "qmljs" },
				},
				bashls = {},
			}
local ensure_installed = vim.tbl_keys(servers or {})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "bashls", "pyright", "rust_analyzer", "qmlls"},
})
