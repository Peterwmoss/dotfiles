local ts = require('telescope')
local actions = require('telescope.actions')

ts.setup({
  pickers = {
    git_branches = {
      mappings = {
        i = {
          ["<cr>"] = actions.git_switch_branch,
          ["<c-d>"] = actions.git_delete_branch,
        },
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
