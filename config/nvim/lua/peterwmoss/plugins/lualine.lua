return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox-material',
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', right_padding = 2 },
          },
          lualine_b = { 'filename', },
          lualine_c = { 'branch', 'diff', 'diagnostics' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = {
            { 'location', left_padding = 2 },
          },
        },
      }
    end
  },
}
