return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  opts = {
    auto_update = true,
    user = "otahiri-",
    mail = "otahiri-@student.1337.ma",
    -- add other options.
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
