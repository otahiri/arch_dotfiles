
vim.api.nvim_create_autocmd({"FileType", "BufEnter"}, {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
			if lang then
		    		pcall(vim.treesitter.start)
			end
	end,
})

local native_ensure_installed = {
	"python",
	"rust",
	"c",
	"lua",
	"bash",
}

vim.api.nvim_create_autocmd("User", {
	pattern = "PackChanged",
	callback = function ()
		for _, lang in ipairs(native_ensure_installed) do
			local success, _ = pcall(vim.treesitter.language.add, lang)
			if not success then
				vim.cmd("TSInstall" .. lang)
			end
		end
	end,
})
