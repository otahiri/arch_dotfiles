vim.pack.add({
	{src = "https://github.com/saghen/blink.cmp.git"},
})
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
	},
	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
		trigger = {
			show_on_insert_on_trigger_character = true,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
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
		},
	},

	fuzzy = { implementation = "lua" },

	signature = { enabled = true },
})
