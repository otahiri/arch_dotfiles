vim.pack.add({
	{src = "https://github.com/saghen/blink.cmp.git"},
	{src = "https://github.com/ribru17/blink-cmp-spell"},
})


local show_state = "/tmp/show_state"
local function set_show_state(state)
	local f = io.open(show_state, "w")
	if f then
		f:write(tostring(state))
		f:close()
	end
end

local function get_show_state()
	local f = io.open(show_state, "r")
	if f then
		local content = f:read("*a")
		f:close()
		return content == "true"
	else
		return false
	end
end

vim.keymap.set('n', "<C- >", function ()
	local show = get_show_state()
	set_show_state(not show)
	local status = show and "OFF" or "ON"
	vim.notify("toggled blink auto show ".. status)
end, {desc = "toggled blink auto complete auto show on and off"})

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<CR>"] = {
			function(cmp)
				if cmp.is_visible() then
					return cmp.accept()
				end
			end,
			"fallback",
		},
		['<C-n>'] = {"show", "select_next", "fallback"},
		['<C-p>'] = {"select_prev", "fallback"},
		['<C-e>'] = {"hide", "fallback"},

	},
	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		menu = {
			auto_show = function (ctx)
				return get_show_state()
			end },
		documentation = { auto_show = false, auto_show_delay_ms = 100 },
		trigger = {
			show_on_insert_on_trigger_character = true,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			markdown = {"spell","buffer", "path"},
			text = {"spell", "buffer"},
		},
		providers = {
			lsp = {
				transform_items = function(_, items)
					for _, item in ipairs(items) do
						if item.label:match("=$") then
							item.score_offset = (item.score_offset or 0) - 5
						else
							item.score_offset = (item.score_offset or 0) + 5
						end
					end
					return items
				end,
			},
			spell = {
				name = "Spell",
				module = "blink-cmp-spell",
				opts = {
					max_entries = 5,
				},
			},
		},
	},

	fuzzy = { implementation = "lua" },

	signature = { enabled = true },
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config['clangd'] = {
	cmd  = {'clangd', '--background-index'},
	filetypes = {'c', 'h', 'cpp', 'hpp', 'objc', 'objcpp'},
	root_markers = {'Makefile', '.git'},
	capabilities = capabilities,
}

vim.lsp.enable('clangd')


vim.lsp.config['lua_ls'] = {
  cmd = { 'lua_ls' },
  filetypes = { 'lua' },
  root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },
  settings = {
	Lua = {
	      runtime = {
		version = 'LuaJIT',
	      },
      }
  },
	capabilities = capabilities,

}
vim.lsp.enable('lua_ls')

vim.lsp.config['pyright'] = {


  cmd = { 'pyright-langserver', '--stdio' },

  filetypes = { 'python' },

  root_markers = { 'pyproject.toml', '.git' },
  capabilities = capabilities,


  settings = {
	python = {
		    analysis = {
			typeCheckingMode = "basic",
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
		    }
		}
	}

}
vim.lsp.enable('pyright')
