vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function ()
		vim.keymap.set("n", "<CR>","<CR><cmd>cclose<CR>", {buffer = true, silent = true})
	end
})


vim.api.nvim_create_autocmd("FileType", {
	pattern = {"markdown", "md"},
	callback = function ()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})
