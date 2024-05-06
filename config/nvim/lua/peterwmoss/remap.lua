local addMapping = function(modes, binding, mapping, opts)
  if opts == nil then
    opts = {}
    opts.noremap = true
    opts.desc = tostring(mapping)
  end
  vim.keymap.set(modes, binding, mapping, opts)
end

vim.g.mapleader = ' '

-- a
-- b
addMapping('n', '<tab>', vim.cmd.bnext, { desc = 'Next buffer' })
addMapping('n', '<s-tab>', vim.cmd.bprev, { desc = 'Previous buffer' })
-- c
addMapping({ 'v', 'x', 's' }, '<leader>cl', '<Plug>(comment_toggle_linewise_visual)', { desc = "Toggle line comment" })
addMapping({ 'v', 'x', 's' }, '<leader>cb', '<Plug>(comment_toggle_blockwise_visual)', { desc = "Toggle block comment" })
addMapping('n', '<leader>c', function()
  return vim.api.nvim_get_vvar('count') == 0 and '<Plug>(comment_toggle_linewise_current)'
      or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true, desc = "Toggle line comment" })
-- d
addMapping({ 'v', 'x', 's' }, '<leader>d', [["_d]], { desc = 'Delete into register _' })
addMapping('n', '<C-d>', '<C-d>zz')
addMapping('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
addMapping('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition > '))
end, { desc = 'Add breakpoint with condition' })
addMapping('n', '<leader>dc', function() require("dap").continue() end, { desc = 'Continue' })
addMapping('n', '<leader>dN', function() require("dap").step_into() end, { desc = 'Step into' })
addMapping('n', '<leader>dn', function() require("dap").step_over() end, { desc = 'Step over' })
addMapping('n', '<leader>dt', function()
  require("dap").terminate()
  require("dapui").close()
  require("dap").repl.close()
end, { desc = 'Terminate' })
addMapping('n', '<leader>do', function() require("dapui").open() end, { desc = 'Open debug UI' })
addMapping('n', '<leader>dk', function()
  require("dapui").close()
  require("dap").repl.close()
end, { desc = 'Kill debugger' })
-- e
addMapping('n', '<leader>e', function() require("nvim-tree.api").tree.toggle({ find_file = true, }) end,
  { desc = 'Open file tree' })
-- f
addMapping('n', '<C-f>', vim.lsp.buf.format)
addMapping('n', '<leader>fs', function() require('telescope.builtin').live_grep() end, { desc = 'Find string (live grep)' })
addMapping('n', '<leader>ff', function()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    require('telescope.builtin').git_files({
      show_untracked = true,
      hidden = true,
    })
  else
    require('telescope.builtin').find_files({
      no_ignore = true,
      hidden = true,
    })
  end
end, { desc = 'Find file' })
-- g
addMapping('n', '<leader>gs', function() vim.cmd.Git() end, { desc = 'Git status' })
addMapping('n', '<leader>ghs', function() require('gitsigns').preview_hunk() end,
  { desc = 'Git preview hunk under cursor' })
addMapping('n', '<leader>ghR', function() require('gitsigns').reset_hunk() end, { desc = 'Git reset hunk under cursor' })
addMapping('n', '<leader>gp', function() vim.cmd.Git('pull --prune') end, { desc = 'Git pull' })
addMapping('n', '<leader>gP', function() vim.cmd.Git('push') end, { desc = 'Git push' })
addMapping('n', '<leader>gfP', function() vim.cmd.Git('push --force-with-lease') end, { desc = 'Git force push' })
addMapping('n', '<leader>gl', function() vim.cmd.Git('log --graph --oneline') end, { desc = 'Git log' })
addMapping('n', '<leader>gfb', function() vim.cmd.Git('blame') end, { desc = 'Git blame' })
addMapping('n', '<leader>gcb', function() require('telescope.builtin').git_branches() end, { desc = 'Git branches' })
addMapping('n', '<leader>gcnb', ':Git switch -c ', { desc = 'Git switch to new branch' })
-- h
addMapping('n', '<C-h>', '<C-w>h')
addMapping('n', '<leader>h', function() require("harpoon.ui").toggle_quick_menu() end, { desc = 'Harpoon quick menu' })
addMapping('n', '<leader>H', function() require("harpoon.mark").add_file() end, { desc = 'Harpoon add file' })
-- i
-- j
addMapping('n', '<C-j>', '<C-w>j')
addMapping('t', '<C-j>', [[<C-\><C-n><C-w>j]])
addMapping('n', 'J', 'mzJ`z')
addMapping('n', '<leader>jwd', function() require 'peterwmoss'.wipe_java_lsp_data() end, { desc = 'Java wipe lsp data' })

addMapping('n', '<leader>jdt', function()
  local test_term = require('toggleterm.terminal').Terminal:new({ cmd = "./gradlew clean test --debug-jvm", hidden = true })
  test_term:toggle()
end)
addMapping('n', '<leader>jdr', function()
  local run_term = require('toggleterm.terminal').Terminal:new({ cmd = "./gradlew bootRun --debug-jvm", hidden = true })
  run_term:toggle()
end)
-- k
addMapping('n', '<C-k>', '<C-w>k')
addMapping('t', '<C-k>', [[<C-\><C-n><C-w>k]])
-- l
addMapping('n', '<C-l>', '<C-w>l')
addMapping('n', '<leader>L', vim.cmd.Lazy, { desc = 'Open Lazy' })
-- m
-- n
-- o
-- p
addMapping({ 'v', 'x', 's' }, '<leader>p', [["_dP]], { desc = 'Paste and send deleted into register _' })
addMapping('n', '<C-p>', function() require('telescope.builtin').commands() end, { desc = 'Run command' })
-- q
addMapping('n', '<leader>q', vim.cmd.q, { desc = 'Quit' })
-- r
-- s
addMapping('', '<leader>ss', function() vim.cmd.Silicon() end, { desc = "Take screenshot" })
-- t
addMapping('n', '<C-t>', function() require("toggleterm").toggle(nil, nil, nil, 'float') end)
addMapping('t', '<C-t>', vim.cmd.ToggleTerm)
addMapping('t', '<M-q>', [[<C-\><C-n>]])
addMapping('n', '<leader>tt', function() require('trouble').toggle() end, { desc = 'Trouble toogle' })
addMapping('n', '<leader>tn', function() require('trouble').next({skip_groups = true, jump = true}) end, { desc = 'Next diagnostic' })
addMapping('n', '<leader>tp', function() require('trouble').previous({skip_groups = true, jump = true}) end, { desc = 'Previous diagnostic' })
-- u
addMapping('n', '<C-u>', '<C-u>zz')
-- v
-- w
addMapping('n', '<leader>w', vim.cmd.w, { desc = 'Save' })
addMapping('n', '<leader>W', vim.cmd.wa, { desc = 'Save all' })
-- x
addMapping('n', '<leader>x', function() vim.cmd.bdelete() end, { desc = 'Close current buffer' })
addMapping('n', '<leader>X', ":silent! mkview<cr>:%bd|e#|bd#<cr>:silent! loadview<cr>", { desc = 'Close all buffers except current' })
-- y
addMapping('n', 'Y', 'y$')
addMapping('n', 'yA', "m'ggyG`'zz", { desc = 'Yank entire file' })
-- z
-- æ
-- ø
addMapping('', 'ø', '%')
-- å
addMapping('', 'å', '$')
-- symbols
addMapping('n', '<leader>.', vim.cmd.so, { desc = 'Source current file' })
addMapping('n', '{', '<C-^>')
addMapping('n', '}', '%')
addMapping('', ',', ';')
addMapping('n', '\'', '%')
addMapping('', ';', ',')
addMapping({ 'v', 'x', 's' }, '<', '<gv')
addMapping({ 'v', 'x', 's' }, '<tab>', '>gv')
addMapping({ 'v', 'x', 's' }, '>', '>gv')
addMapping({ 'v', 'x', 's' }, '<S-tab>', '<gv')
addMapping('i', '<cr>', '<cr><c-g>u')
addMapping('i', ',', ',<c-g>u')
addMapping('i', '.', '.<c-g>u')
addMapping('i', '!', '!<c-g>u')
addMapping('i', '?', '?<c-g>u')
addMapping('n', '<F12>', function() require("dap").continue() end, { desc = 'Continue' })
addMapping('n', '<F11>', function() require("dap").step_into() end, { desc = 'Step into' })
addMapping('n', '<F10>', function() require("dap").step_over() end, { desc = 'Step over' })
