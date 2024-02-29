require('lualine').setup{
  options = {
    theme = 'gruvbox-material',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', right_padding = 2 },
    },
    lualine_b = {
      {
        'buffers',
        buffers_color = {
          active = { fg = '#cccccc', bg = '#666666' },
          inactive = { fg = '#333333', bg = '#555555' },
        },
      }
    },
    lualine_c = { 'branch', 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
  },
}

