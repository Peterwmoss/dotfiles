local ts = require('telescope')

ts.setup({
  defaults = {
    layout_config = {
      prompt_position = 'top'
    },
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    preview = false,
  }
})

ts.load_extension('ui-select')
