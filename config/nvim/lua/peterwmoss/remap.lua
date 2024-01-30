local addMapping = function(modes, binding, mapping, opts)
  vim.keymap.set(modes, binding, mapping, opts)
end

vim.g.mapleader = ' '

-- a
-- b
-- c
addMapping({ 'v', 'x', 's' }, '<leader>cl', '<Plug>(comment_toggle_linewise_visual)')
addMapping({ 'v', 'x', 's' }, '<leader>cb', '<Plug>(comment_toggle_blockwise_visual)')
addMapping('n', '<leader>c', function()
  return vim.api.nvim_get_vvar('count') == 0 and '<Plug>(comment_toggle_linewise_current)'
      or '<Plug>(comment_toggle_linewise_count)'
end, { expr = true })
-- d
addMapping({ 'v', 'x', 's' }, '<leader>d', [["_d]])
addMapping('n', '<C-d>', '<C-d>zz')
addMapping('n', '<leader>db', require("dap").toggle_breakpoint)
addMapping('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition > '))
end)
addMapping('n', '<leader>dc', require("dap").continue)
addMapping('n', '<leader>dN', require("dap").step_into)
addMapping('n', '<leader>dn', require("dap").step_over)
addMapping('n', '<leader>dt', require("dap").terminate)
addMapping('n', '<leader>do', require("dapui").open)
addMapping('n', '<leader>dk', function()
  require("dapui").close()
  require("dap").repl.close()
end)
-- e
addMapping('n', '<leader>e', function() require("nvim-tree.api").tree.toggle({ find_file = true, }) end)
-- f
addMapping('', 'f',
  function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }) end,
  { remap = true })
addMapping('', 'F',
  function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true }) end,
  { remap = true })
addMapping('n', '<C-f>', vim.lsp.buf.format)
addMapping('n', '<leader>fs', require('telescope.builtin').live_grep)
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
end)
-- g
addMapping('n', '<leader>gs', function() vim.cmd.Git() end)
addMapping('n', '<leader>gp', function() vim.cmd.Git('pull --prune') end)
addMapping('n', '<leader>gP', function() vim.cmd.Git('push') end)
addMapping('n', '<leader>gfP', function() vim.cmd.Git('push --force-with-lease') end)
addMapping('n', '<leader>gl', function() vim.cmd.Git('log --graph --oneline') end)
addMapping('n', '<leader>gfb', function() vim.cmd.Git('blame') end)
addMapping('n', '<leader>gcb', function() require('telescope.builtin').git_branches() end)
addMapping('n', '<leader>gcnb', ':Git checkout -b ')
-- h
addMapping('n', '<C-h>', '<C-w>h')
addMapping('n', '<leader>h', require("harpoon.ui").toggle_quick_menu)
addMapping('n', '<leader>H', require("harpoon.mark").add_file)
-- i
-- j
addMapping('n', '<C-j>', '<C-w>j')
addMapping('n', 'J', 'mzJ`z')
-- k
addMapping('n', '<C-k>', '<C-w>k')
-- l
addMapping('n', '<C-l>', '<C-w>l')
addMapping('n', '<leader>L', vim.cmd.Lazy)
-- m
-- n
-- o
-- p
addMapping({ 'v', 'x', 's' }, '<leader>p', [["_dP]])
addMapping('n', '<C-p>', require('telescope.builtin').commands)
-- q
addMapping('n', '<leader>q', vim.cmd.q)
-- r
-- s
-- t
addMapping('', 't',
  function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end,
  { remap = true })
addMapping('', 'T',
  function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end,
  { remap = true })
addMapping('n', '<C-t>', function() require("toggleterm").toggle(nil, nil, nil, 'float') end)
addMapping('t', '<C-t>', vim.cmd.ToggleTerm)
addMapping('t', '<M-q>', [[<C-\><C-n>]])
-- u
addMapping('n', '<C-u>', '<C-u>zz')
-- v
-- w
addMapping('n', '<leader>w', vim.cmd.w)
-- x
addMapping('n', '<leader>X', function() vim.cmd.bclose() end)
-- y
addMapping('n', 'Y', 'y$')
addMapping('n', 'yA', "m'ggyG`'zz")
-- z
-- æ
-- ø
addMapping('', 'ø', '%')
-- å
addMapping('', 'å', '$')
-- symbols
addMapping('n', '<leader>.', vim.cmd.so)
addMapping('n', '{', '<C-^>')
addMapping('n', '}', '%')
addMapping('', ',', ';')
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
