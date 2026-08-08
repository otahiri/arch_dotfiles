vim.pack.add({
	{src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"},
})
require("nvim-treesitter-textobjects").setup {
  select = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
      -- ['@class.outer'] = '<c-v>', -- blockwise
    },
    -- If you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. Succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true of false
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
