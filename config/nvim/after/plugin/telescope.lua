local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.commands)
vim.keymap.set('n', '<leader>f', function() builtin.find_files({ hidden = true }) end)

vim.keymap.set('n', '<leader>th', builtin.help_tags)
vim.keymap.set('n', '<leader>ts', builtin.grep_string)
vim.keymap.set('n', '<leader>tk', builtin.keymaps)
vim.keymap.set('n', '<leader>tm', builtin.marks)
vim.keymap.set('n', '<leader>tr', builtin.registers)
vim.keymap.set('n', '<leader>tgf', builtin.git_files)
vim.keymap.set('n', '<leader>tgb', builtin.git_branches)
vim.keymap.set('n', '<leader>tgc', builtin.git_commits)
