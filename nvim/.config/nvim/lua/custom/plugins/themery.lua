return {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
		local my_themes = {
			"lucario",
			"sonokai",
			"material-palenight",
			"material-oceanic",
			"material-deep-ocean",
			"material-darker",
			"rose-pine-moon",
			"kanagawa",
			"kanagawa-wave",
			"WinterIsComing-dark-color-theme",
			"night-owl",
			"cyberdream",
			"omni",
			"catppuccin",
			"gruber-darker",
			"dracula",
			"tokyodark",
			"oxocarbon",
			"tokyonight-night",
			"tokyonight-storm",
			"gruvbox",
			"tender",
			"deep-space",
			"edge",
			"monokai-pro-classic",
			"monokai-pro-machine",
			"monokai-pro-octagon",
			"monokai-pro-ristretto",
			"monokai-pro-spectrum",
			"void",
			"molokai",
			"one",
			"OceanicNext",
			"vaporwave",
			"onedark",
			"onedark_vivid",
			"onedark_dark",
		}
		local themery = require('themery')
		themery.setup({
	     		themes = my_themes,
			livePreview = true,
	    	})
		math.randomseed(os.time())
		local rand = math.random(#my_themes)
		print(rand)
		themery.setThemeByIndex(rand, false)
        end
}
