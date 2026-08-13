vim.pack.add({
	{src = "https://github.com/mfussenegger/nvim-lint"},
})

local status, lint = pcall(require, "lint")
if not status then
  return
end

lint.linters.norminette = {
  name = 'norminette',
  cmd = 'norminette',
  stdin = false,
  append_fname = true,
  args = {},
  stream = 'stdout',
  ignore_exitcode = true,
  parser = function(output, bufnr)
    local diagnostics = {}
    
    for line in string.gmatch(output, "[^\r\n]+") do
      local severity_str, code, line_num, col_num, message = string.match(line, "^(%a+):%s*([%w_]+)%s*%(line:%s*(%d+),%s*col:%s*(%d+)%):%s*(.*)")
      
      if line_num and col_num and message then
        local severity = vim.diagnostic.severity.ERROR
        if severity_str == "Notice" or severity_str == "Warning" then
          severity = vim.diagnostic.severity.WARN
        end
        
        table.insert(diagnostics, {
          lnum = tonumber(line_num) - 1,
          col = tonumber(col_num) - 1,
          severity = severity,
          source = "norminette",
          message = message .. " (" .. code .. ")",
        })
      end
    end
    return diagnostics
  end
}



require("lint").linters_by_ft = {
	python = {"flake8", "mypy"},
	c = { "norminette",},
}


vim.api.nvim_create_autocmd({"BufWritePost", "BufReadPost", "InsertLeave"},
{
	callback = function ()
		require("lint").try_lint()
	end
})

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
