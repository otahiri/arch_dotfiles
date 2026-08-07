
-- 1. Register Mason via the native manager
vim.pack.add({"https://github.com/mason-org/mason.nvim"})

-- 2. Boot Mason UI
require("mason").setup()

-- 3. CRITICAL: Inject Mason's hidden tool path directly into Neovim
-- Without this, Neovim cannot find the "pyright-langserver" command!
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. (vim.fn.has("win32") == 1 and ";" or ":") .. vim.env.PATH

-- 4. Set up the universal engine blueprint
vim.lsp.config["pyright"] = {
  cmd = { "pyright-langserver", "--standardio" },
  filetypes = { "python" },
  root_dir = function(fname)
    local project_root = vim.fs.root(fname, { ".git", "pyproject.toml", "setup.py" })
    if project_root then
      return project_root
    end
    -- Single-file universal fallback
    return vim.fs.dirname(fname) or vim.uv.cwd()
  end,
}

-- 5. Turn the engine framework on natively
vim.lsp.enable("pyright")

