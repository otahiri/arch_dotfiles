return {
  'goolord/alpha-nvim',
  -- dependencies = { 'nvim-mini/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local startify = require 'alpha.themes.startify'
    dashboard.section.header.val = {
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣽⣍⡉⠯⢉⠁⠒⣈⣥⣶⣦⣈⣝⣿⣿⣿⠿⣿⣿⣿⣿⡿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣟⡋⠅⠀⠀⣀⣨⡭⠽⠛⣛⣻⣟⣯⡑⢿⡿⢦⣨⠀⠀⠀⠀]],
      [[⠉⠩⠉⠛⢛⡟⠋⣁⣄⠴⢾⣿⠟⢁⣶⠶⠛⢉⠽⣿⠟⣻⣄⠙⡄⡈⢣⡀⠀⠀]],
      [[⠀⠈⠙⡿⠏⠀⠔⢀⡠⠞⢋⠀⠔⡋⠀⠀⡠⠆⠊⠀⣠⡟⢻⣄⢰⢸⢆⣷⣦⣤]],
      [[⡷⢦⣮⠊⡠⠂⠀⠊⠔⢀⠂⠆⠐⠠⢠⣎⠔⡀⡤⠞⠉⢴⠈⡏⡎⢸⠈⣾⣿⣿]],
      [[⣶⣶⡕⡰⣠⠅⢀⣤⣮⡆⡌⠌⠀⣤⣚⣥⣌⣛⠒⣥⠞⠈⡨⣱⠃⡜⢸⢱⣿⣿]],
      [[⣿⣿⣿⣾⡑⠠⢼⠑⣻⢇⡼⡄⡗⠹⢀⡸⠞⢻⠬⢐⡞⣬⢭⣯⡈⣷⠘⣸⠀⠈]],
      [[⣿⣿⣿⣿⣧⢠⠘⣮⣹⣄⠒⠿⠄⠀⠀⠀⠈⠁⠀⠀⠀⠥⣙⣛⢷⢇⡷⠋⠀⠀]],
      [[⣿⣿⣿⣿⣿⡸⢸⣿⣦⣀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠃⡀⠔⡷⠻⡇⠀⠀⠀]],
      [[⣿⣿⣿⣿⣿⣿⣌⣿⣿⣟⠸⡑⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠁⠀⣠⣤⣤⡀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠐⢅⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣷⣶⣶⣿⣿⣋⡁]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠡⡈⢪⢦⣄⡀⠀⠀⠀⣠⣾⣿⣿⣿⡿⠿⠿⠟⠋]],
      [[⣿⣿⣿⣿⣿⣿⣟⢿⣿⣿⣤⣤⣵⣤⣷⣮⣽⣷⣶⣴⣿⣿⣿⣯⣤⣤⣤⣄⣀⡀]],
      [[⣿⣿⣿⣿⣿⠿⠟⢋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿]],
    }
    dashboard.section.buttons.val = {
      dashboard.button('f', 'search for a file', ':Telescope find_files <CR>'),
      dashboard.button('e', 'open file explorer', ':Neotree <CR>'),
      dashboard.button('r', 'open recent files', ':Telescope oldfiles <CR>'),
    }

    -- available: devicons, mini, default is mini
    -- if provider not loaded and enabled is true, it will try to use another provider
    startify.file_icons.provider = 'devicons'
    alpha.setup(dashboard.opts)
  end,
}
