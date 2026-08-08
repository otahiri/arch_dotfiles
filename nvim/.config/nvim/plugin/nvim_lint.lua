vim.pack.add({
	{src = "https://github.com/mfussenegger/nvim-lint"},
})
require("lint").linters_by_ft = {
	python = {"flake8", "mypy"},
	c = {"norminette"}
}
vim.lsp.config.rust_analyzer = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" },
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
}

vim.lsp.enable("rust_analyzer")
