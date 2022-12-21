local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.commands)
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>g', builtin.git_files)
vim.keymap.set('n', '<leader>F', function() builtin.find_files({ hidden = true }) end)

vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>lws', builtin.lsp_workspace_symbols)

vim.keymap.set('n', '<leader>th', builtin.help_tags)
vim.keymap.set('n', '<leader>ts', builtin.grep_string)
vim.keymap.set('n', '<leader>tk', builtin.keymaps)
vim.keymap.set('n', '<leader>tm', builtin.marks)
vim.keymap.set('n', '<leader>tr', builtin.registers)
vim.keymap.set('n', '<leader>tgf', builtin.git_files)
vim.keymap.set('n', '<leader>tgb', builtin.git_branches)
vim.keymap.set('n', '<leader>tgc', builtin.git_commits)
