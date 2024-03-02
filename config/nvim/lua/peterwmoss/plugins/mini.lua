return {
  {
    'echasnovski/mini.nvim',
    keys = 'gT',
    version = false,
    config = function()
      require('mini.align').setup({
        mappings = {
          start = '',
          start_with_preview = 'gT',
        }
      })
    end,
  },
}
