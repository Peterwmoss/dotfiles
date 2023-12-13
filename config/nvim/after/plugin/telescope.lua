local ts = require('telescope')
local builtin = require('telescope.builtin')
local normalMappings = require('peterwmoss.remap.normal')

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

normalMappings.addMapping('<C-p>', builtin.commands)

normalMappings.addLeaderMapping( 'fS', builtin.lsp_document_symbols)
normalMappings.addLeaderMapping( 'fs', builtin.live_grep)

normalMappings.addLeaderMapping('ff', function()
  builtin.find_files({
    hidden = true
  })
end)

normalMappings.addLeaderMapping( 'fg', function()
  builtin.git_files({
    hidden = true,
    show_untracked = true,
  })
end)
