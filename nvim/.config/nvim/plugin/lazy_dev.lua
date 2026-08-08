vim.pack.add({
	{src = "https://github.com/folke/lazydev.nvim"},
})
require("lazydev").setup()

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.emmyrc.json', '.luarc.json', '.git' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' }
        }
    }
})
