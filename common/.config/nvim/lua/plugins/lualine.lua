return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup {
      inactive_sections = {
        lualine_x = {},
      },
      options = {
        theme = 'dracula',
        component_separators = { '', '' },
      },
      sections = {
        lualine_c = {{'filename', path = 1}},
        lualine_x = { 'fileformat', 'filetype' },
      },
      tabline = {
        lualine_b = {'branch'}
      }
    }
  end,
}
