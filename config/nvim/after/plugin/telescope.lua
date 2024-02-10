local ts = require('telescope')
local actions = require('telescope.actions')

ts.setup({
  pickers = {
    git_branches = {
      mappings = {
        i = { ["<cr>"] = actions.git_checkout },
      },
    },
  },
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
