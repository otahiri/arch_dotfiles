return {
	"sainnhe/everforest",
	"cocopon/iceberg.vim",
	"marko-cerovac/material.nvim",
	"oahlen/iceberg.nvim",
	"rose-pine/neovim",
	"gbprod/nord.nvim",
	"rebelot/kanagawa.nvim",
	"atmosuwiryo/vim-winteriscoming",
	"oxfist/night-owl.nvim",
	"jpwol/thorn.nvim",
	"daschw/leaf.nvim",
	"scottmckendry/cyberdream.nvim",
	{
		"getomni/neovim",
    		name = "omni",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	"blazkowolf/gruber-darker.nvim",
	"thepogsupreme/mountain.nvim",
	"Mofiqul/dracula.nvim",
	"tiagovla/tokyodark.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	"Ureakim/nebulae.nvim",
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
		    local themes = {
			"everforest",
			"iceberg",
			"material-palenight",
			"material-oceanic",
			"material-deep-ocean",
			"material-darker",
			"rose-pine-moon",
			"nord",
			"nordfox",
			"kanagawa",
			"kanagawa-dragon",
			"kanagawa-wave",
			"WinterIsComing-dark-color-theme",
			"WinterIsComing-dark-blue-color-theme",
			"night-owl",
			"thorn",
			"thorn-dark-cold",
			"thorn-dark-warm",
			"leaf",
			"cyberdream",
			"omni",
			"catppuccin",
			"catppuccin-macchiato",
			"catppuccin-frappe",
			"gruber-darker",
			"mountain",
			"dracula",
			"tokyodark",
			"oxocarbon",
			"nebulae",
			"tokyonight-night",
			"tokyonight-storm",
		    }
		    math.randomseed(os.time())
		    local random_theme = themes[math.random(#themes)]

		    -- Apply it!
		    vim.cmd("colorscheme " .. random_theme)
		    
		    -- Optional: Send a notification so you know which one loaded
		    -- print("Today's Theme: " .. random_theme)
		end,
	},
}
