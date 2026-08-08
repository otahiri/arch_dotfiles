vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua_ls' },
  filetypes = { 'lua' },
  root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },
  settings = {
	Lua = {
	      runtime = {
		version = 'LuaJIT',
	      },
      }
  }

}
vim.lsp.enable('lua_ls')

vim.lsp.config['pyright'] = {


  cmd = { 'pyright-langserver', '--stdio' },

  filetypes = { 'python' },

  root_markers = { 'pyproject.toml', '.git' },


  settings = {
	python = {
		    analysis = {
			typeCheckingMode = "basic",
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
		    }
		}
	}

}
vim.lsp.enable('pyright')
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.o.relativenumber = true
vim.o.number = true

vim.opt.signcolumn = "yes"


vim.diagnostic.config({
	float = {

		border = "rounded",
		source = true,
	},
})
