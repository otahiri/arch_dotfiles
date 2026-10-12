
vim.g.user = os.getenv("LOGNAME") or os.getenv("USER")
vim.g.mail = string.format("%s@student.1337.ma", vim.g.user)
vim.pack.add({
	{src = "https://github.com/Diogo-ss/42-header.nvim"},
})
require("42header").setup({
	default_map = false,
    	auto_update = true,
})
