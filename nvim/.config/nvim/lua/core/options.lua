vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)


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
