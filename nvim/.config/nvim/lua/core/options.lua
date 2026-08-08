vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.lsp.config['lua_ls'] = {

  -- Command and arguments to start the server.

  cmd = { 'lua_ls' },

  -- Filetypes to automatically attach to.

  filetypes = { 'lua' },

  -- Sets the workspace "root" to the directory where any of these files is found.

  -- Files sharing a root will reuse the LSP client/connection.

  -- Nested lists indicate equal priority, see |vim.lsp.Config|.

  root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },

  -- Server-specific settings. https://github.com/EmmyLuaLs/emmylua-analyzer-rust/blob/main/docs/config/emmyrc_json_EN.md

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
    prefix = '●', -- Options: '■', 'x', '~', or any character you prefer
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
