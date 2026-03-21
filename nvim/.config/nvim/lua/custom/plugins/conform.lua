return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  lazy = true,
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>cF',
      function() require('conform').format { formatters = { 'injected' }, timeout_ms = 3000 } end,
      mode = { 'n', 'x' },
      desc = 'Format Injected Langs',
    },
  },
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      fish = { 'fish_indent' },
      sh = { 'shfmt' },
      c = { 'c_formatter_42' },
      h = { 'c_formatter_42' },
      cpp = { 'c_formatter_42' },
      hpp = { 'c_formatter_42' },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      c_formatter_42 = {
        command = 'c_formatter_42',
        args = { '$FILENAME' },
        stdin = false,
      },
    },
  },
}
