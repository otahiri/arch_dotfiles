local function lint()
	local name = vim.fn.expand("%:e")
	if name == "py" then
		vim.cmd("silent! %s/\\t/    /g")
	end
end

local function header()
	local name = vim.fn.expand("%:e")
	if name == "c" or name == "h" then
		vim.cmd("silent! Stdheader")
	end
end

local function format()
	local name = vim.fn.expand("%:e")
	if name == "c" or name == "h" then
		vim.cmd("silent! CFormat")
	elseif name == "py" then
		vim.cmd("silent! Format")
	end
end

vim.keymap.set("n", "<leader>w", function()
	vim.cmd("silent! w")
end, { desc = "save file" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.api.nvim_create_autocmd("BufWritePost", { callback = lint })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
end, { desc = "open config files" })
vim.keymap.set("n", "<leader>fo", function()
	Snacks.dashboard.pick("oldfiles")
end, { desc = "open old files" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.dashboard.pick("live_grep")
end, { desc = "find file" })
vim.keymap.set("n", "<leader>fn", function()
	vim.cmd("silent! ene |startinsert")
end, { desc = "open new file" })
vim.keymap.set("n", "<F1>", header)
vim.keymap.set("n", "<leader>cf", format, { desc = "format file" })
vim.keymap.set("n", "<leader>e", function()
	local explorer = Snacks.picker.get({ source = "explorer" })[1]
	if explorer then
		explorer:close()
	else
		Snacks.explorer.reveal()
	end
end, { desc = "open file explorer" })
vim.keymap.set("n", "<F1>", header)

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
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
vim.keymap.set("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "rename file" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename var" })
vim.keymap.set("n", "<leader>fh", function()
	vim.cmd 'silent! Telescope help_tags'
end, { desc = "search help page" })
vim.keymap.set("n", "<leader>fg",  function ()
	vim.cmd 'silent! Telescope live_grep'
end, { desc = "live grep current directory" })

vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Select outer function" })

vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Select inner function" })

vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Select outer class" })

vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner class" })

vim.keymap.set({ "x", "o" }, "il", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end, { desc = "Select inner loop" })

vim.keymap.set({ "x", "o" }, "al", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end, { desc = "Select outer loop" })

vim.keymap.set("n", "<leader>tr", function()
	local themes = {
			"material-palenight",
			"material-oceanic",
			"material-deep-ocean",
			"material-darker",
			"rose-pine-moon",
			"kanagawa",
			"kanagawa-wave",
			"WinterIsComing-dark-color-theme",
			"night-owl",
			"cyberdream",
			"omni",
			"catppuccin",
			"gruber-darker",
			"dracula",
			"tokyodark",
			"oxocarbon",
			"tokyonight-night",
			"tokyonight-storm",
			"gruvbox",
			"tender",
			"deep-space",
			"edge",
			"monokai-pro-classic",
			"monokai-pro-machine",
			"monokai-pro-octagon",
			"monokai-pro-ristretto",
			"monokai-pro-spectrum",
			"void",
			"molokai",
			"one",
			"OceanicNext",
		    }
	local random_theme = themes[math.random(#themes)]
	vim.cmd("colorscheme " .. random_theme)
	print("Switched to: " .. random_theme)
end, { desc = "Theme Reroll (Random)" })
