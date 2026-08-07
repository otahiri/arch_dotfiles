vim.pack.add({
		{src = "https://github.com/romus204/tree-sitter-manager.nvim"}
	})
require("tree-sitter-manager").setup({
	ensure_installed = {'python', 'rust', 'c', 'lua', 'bash'},
	auto_install = true,
	})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "rust", "python", "lua", "bash" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
