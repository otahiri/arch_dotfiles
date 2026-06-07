return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("neogen").setup({
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          }
        }
      }
    })
  end,
  keys = {
    { "<leader>nf", function() require("neogen").generate() end, desc = "Generate [D]ocstring" },
  },
}
