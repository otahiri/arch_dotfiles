vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("w")
end, { desc = "save file" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "escape terminal mode" })
vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, { desc = "rename  variable" })
vim.keymap.set("n", "<leader>tc", function () vim.cmd("silent! Themery") end , { desc = "change color scheme" })
vim.keymap.set("n", "<leader>cl", function()
	Snacks.picker.lsp_config()
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "go to reference" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "go to implementation" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "go to type definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
vim.keymap.set("n", "K", function()
	return vim.lsp.buf.hover()
end, { desc = "show doc for word under cusor" })
vim.keymap.set("n", "gK", function()
	return vim.lsp.buf.signature_help()
end, { desc = "show signature" })
vim.keymap.set("n", "<leader>cd", function ()
	vim.diagnostic.open_float(nil, {focus = true})
end, { desc = "go to declaration" })

vim.keymap.set("n", "<leader>fn", function ()
	vim.cmd("silent! tab new")
end, {desc = "new empty file"})

vim.keymap.set({"n", "v", "i"}, "<F1>", "")
vim.keymap.set("n","<leader>ce",
	function ()
		local current_dir = vim.fn.expand("%:p:h")
		local markers = {"pyproject.toml", "src/__init__.py", "src/__main__.py"}
		local match = vim.fs.find(markers, {upward = true, stop = vim.env.HOME, path = current_dir})
		if #match == 0 then
			vim.notify("no a python project", vim.log.levels.WARN)
			return
		end
		local project_root = vim.fs.dirname(match[1])
		vim.notify("running python project", vim.log.levels.INFO)
		vim.system({"make", "-C", project_root}, {text = true},
			function (result)
				vim.schedule(
					function ()
						local err_msg = result.stderr ~= "" and result.stderr
						vim.fn.confirm("[ERROR]\n" .. err_msg, "&OK", 1, "Warning")
						vim.notify("[LOG]\n" .. result.stdout, vim.log.levels.INFO, {timeout = 2000})
				end)
			end
		)
	end , {desc = "run python project if in a python project dir"})
