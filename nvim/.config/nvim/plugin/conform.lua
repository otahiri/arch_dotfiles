vim.pack.add({
	{src = "https://github.com/stevearc/conform.nvim"},
})
require("conform").setup({
    formatters_by_ft = {
        c = { "c_formatter_42" },
        h = { "c_formatter_42" },
        cpp = { "c_formatter_42" },
        hpp = { "c_formatter_42" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
    },
    formatters = {
	    black = {

	    prepend_args = { "--line-length", "79", "--target-version", "py310" },
	}
    }
})

vim.keymap.set({ "n", "x" }, "<leader>cf", function() require("conform").format({ async = true, timeout_ms = 3000 }) end, {desc =  "Format Injected Langs"})
