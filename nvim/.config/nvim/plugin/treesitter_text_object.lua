vim.pack.add({
	{src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"},
})
require("nvim-treesitter-textobjects").setup {
	select = {
		lookahead = true,
		selection_modes = {
			['@parameter.outer'] = 'v', -- charwise
			['@function.outer'] = 'V', -- linewise
		},
		include_surrounding_whitespace = false,
	},
}

-- function movements and selections
vim.keymap.set({ "x", "o" }, "af", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "if", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]f", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[f", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]F", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[F", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end)





-- paramters selections and movements
vim.keymap.set({ "x", "o" }, "aa", function() require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ia", function() require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]a", function() require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[a", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]A", function() require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[A", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects") end)




-- classes movements and selections
vim.keymap.set({ "x", "o" }, "ac", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end)



-- loops movements and selections
vim.keymap.set({ "x", "o" }, "al", function() require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "il", function() require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]l", function() require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[l", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]L", function() require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[L", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects") end)
