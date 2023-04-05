vim.o.timeout = true
vim.o.timeoutlen = 200

require("which-key").setup {}

local wk = require("which-key")
local ts_bultin = require('telescope.builtin')

-- Normal mode <leader> prefix keymaps
wk.register({
  l = {
    name = 'lsp',
    f = { vim.lsp.buf.format, 'Format Buffer' },
  },
  f = {
    name = 'find',
    f = { function() ts_bultin.find_files({ hidden = true }) end, 'Find File' },
    b = { ts_bultin.buffers, 'Find Buffer' },
    s = { ts_bultin.grep_string, 'String' },
  },
  P = {
    name = 'packer',
    s = { '<cmd>PackerSync<cr>', 'Sync' },
  },
  g = {
    name = 'git',
    b = { ts_bultin.git_branches, 'Branches' },
    B = { function() vim.cmd.Git 'blame' end, 'Blame' },
    d = { vim.cmd.Gvdiffsplit, 'Diff split' },
    s = { vim.cmd.Git, 'Status' },
    m = { function() vim.cmd.Git 'mergetool' end, 'Mergetool' },
    l = { function() vim.cmd.Git('log --graph') end, 'Log' },
    C = {
      name = 'conflict',
      n = { vim.cmd.GitConflictNextConflict, 'Next Conflict' },
      p = { vim.cmd.GitConflictPrevConflict, 'Prev Conflict' },
      j = { vim.cmd.GitConflictChooseTheirs, 'Conflict choose theirs' },
      f = { vim.cmd.GitConflictChooseOurs, 'Conflict choose ours' },
    },
    p = { function() vim.cmd.Git 'pull' end, 'Pull' },
    P = { function() vim.cmd.Git 'push' end, 'Push' },
  },
  v = {
    name = 'vim',
    h = { ts_bultin.help_tags, 'Help' },
    k = { ts_bultin.keymaps, 'Keymaps' },
    r = { ts_bultin.registers, 'Registers' },
  },
  x = { vim.cmd.bdelete, 'Delete buffer' },
  X = { [[:%bd| e# | bd#<CR>]], 'Delete all buffers but current' },
  w = { vim.cmd.w, 'Save' },
  q = { vim.cmd.q, 'Close Window' },
  ['.'] = { vim.cmd.so, 'Source current file' },
}, { prefix = '<leader>' })

-- Normal mode no prefix keymaps
wk.register({
  ['<s-tab>'] = { vim.cmd.BufferLineCyclePrev, 'Prev buffer' },
  ['<tab>'] = { vim.cmd.BufferLineCycleNext, 'Next buffer' },
  ['<C-d>'] = { '<C-d>zz', '' },
  ['<C-u>'] = { '<C-u>zz', '' },
  v = { 'v', '' },
  Q = { 'q', 'Use Q for macros' },
  ['<C-f>'] = { vim.lsp.buf.format, 'Format Buffer' },
  ['<C-h>'] = { '<C-w>h', '' },
  ['<C-j>'] = { '<C-w>j', '' },
  ['<C-k>'] = { '<C-w>k', '' },
  ['<C-l>'] = { '<C-w>l', '' },
  [','] = { ';', '' },
  [';'] = { ',', '' },
  Y = { 'y$', '' },
  n = { 'nzz', '' },
  N = { 'Nzz', '' },
  J = { 'mzJ`z', '' },
  y = {
    A = { "m'ggyG`'zz", 'Yank entire file' },
  },
})

wk.register({
  ['<'] = { '<gv', '' },
  ['>'] = { '>gv', '' },
  ['<s-tab>'] = { '<gv', '' },
  ['<tab>'] = { '>gv', '' },
}, { prefix = '<leader>', mode = 'v' })

wk.register({
  ['<leader>'] = {
    p = { [["_dP]], 'Paste, no overwrite register' },
    d = { [["_d]], 'Delete, no overwrite register' },
  },
  [','] = { ';', '' },
  [';'] = { ',', '' },
}, {
  mode = 'x',
})

wk.register({
  [','] = { ',<c-g>u', '' },
  ['.'] = { '.<c-g>u', '' },
  ['!'] = { '!<c-g>u', '' },
  ['?'] = { '?<c-g>u', '' },
}, { mode = 'i' })

wk.register({
  q = { '^', 'Start of line' },
  ['å'] = { '$', 'End of line' },
  ['æ'] = { '%', 'Matching bracket' },
}, { mode = { 'n', 'o', 'v' } })
