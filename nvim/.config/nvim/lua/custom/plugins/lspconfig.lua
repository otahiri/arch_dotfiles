return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mason.nvim',
    { 'mason-org/mason-lspconfig.nvim', config = function() end },
  },
  opts_extend = { 'servers.*.keys' },
  opts = function()
    ---@class PluginLspOpts
    local ret = {
      servers = {
    rust_analyzer = {},
        ['*'] = {
          keys = {
            { '<leader>cl', function() Snacks.picker.lsp_config() end, desc = 'Lsp Info' },
            { 'gd', vim.lsp.buf.definition, desc = 'Goto Definition', has = 'definition' },
            { 'gr', vim.lsp.buf.references, desc = 'References', nowait = true },
            { 'gI', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
            { 'gy', vim.lsp.buf.type_definition, desc = 'Goto T[y]pe Definition' },
            { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
            { 'K', function() return vim.lsp.buf.hover() end, desc = 'Hover' },
            { 'gK', function() return vim.lsp.buf.signature_help() end, desc = 'Signature Help', has = 'signatureHelp' },
            { '<c-k>', function() return vim.lsp.buf.signature_help() end, mode = 'i', desc = 'Signature Help', has = 'signatureHelp' },
            { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action', mode = { 'n', 'x' }, has = 'codeAction' },
            { '<leader>cc', vim.lsp.codelens.run, desc = 'Run Codelens', mode = { 'n', 'x' }, has = 'codeLens' },
            { '<leader>cC', vim.lsp.codelens.refresh, desc = 'Refresh & Display Codelens', mode = { 'n' }, has = 'codeLens' },
            {
              '<leader>cR',
              function() Snacks.rename.rename_file() end,
              desc = 'Rename File',
              mode = { 'n' },
              has = { 'workspace/didRenameFiles', 'workspace/willRenameFiles' },
            },
            { '<leader>cr', vim.lsp.buf.rename, desc = 'Rename', has = 'rename' },
            {
              ']]',
              function() Snacks.words.jump(vim.v.count1) end,
              has = 'documentHighlight',
              desc = 'Next Reference',
              enabled = function() return Snacks.words.is_enabled() end,
            },
            {
              '[[',
              function() Snacks.words.jump(-vim.v.count1) end,
              has = 'documentHighlight',
              desc = 'Prev Reference',
              enabled = function() return Snacks.words.is_enabled() end,
            },
            {
              '<a-n>',
              function() Snacks.words.jump(vim.v.count1, true) end,
              has = 'documentHighlight',
              desc = 'Next Reference',
              enabled = function() return Snacks.words.is_enabled() end,
            },
            {
              '<a-p>',
              function() Snacks.words.jump(-vim.v.count1, true) end,
              has = 'documentHighlight',
              desc = 'Prev Reference',
              enabled = function() return Snacks.words.is_enabled() end,
            },
          },
        },
      },
    }
    return ret
  end,
}
