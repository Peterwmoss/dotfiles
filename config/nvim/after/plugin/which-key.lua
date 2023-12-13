vim.o.timeout = true
vim.o.timeoutlen = 200

require("which-key").setup { }

local wk = require("which-key")
local ts_bultin = require('telescope.builtin')

-- Normal mode <leader> prefix keymaps
wk.register({
  e = {
    function() require("nvim-tree.api").tree.toggle({ find_file = true, }) end,
    'Explore',
  },
  f = {
    name = 'Find',
    f = {
      function()
        local function exists(file)
          local ok, err, code = os.rename(file, file)
          if not ok then
            if code == 13 then
              -- Permission denied, but it exists
              return true
            end
          end
          return ok, err
        end
        if exists(".git") then
          ts_bultin.git_files({ hidden = true, show_untracked = true })
        else
          ts_bultin.find_files({ hidden = true })
        end
      end, 'File' },
    F = { function() ts_bultin.find_files({ hidden = true }) end, 'File (no .gitignore)' },
    b = { ts_bultin.buffers, 'Buffer' },
    s = { ts_bultin.grep_string, 'String' },
  },
  g = {
    name = 'git',
    b = { ts_bultin.git_branches, 'Branches' },
    B = { ':Git checkout -b ', 'Checkout new branch' },
    f = {
      name = 'File',
      B = { function() vim.cmd.Git 'blame' end, 'Blame' },
    },
    g = { ':Git ', 'Git command' },
    d = { vim.cmd.Gvdiffsplit, 'Diff split' },
    s = { vim.cmd.Git, 'Status' },
    m = { function() vim.cmd.Git 'mergetool' end, 'Mergetool' },
    l = { function() vim.cmd.Git('log --graph') end, 'Log' },
    c = {
      name = 'Conflict',
      n = { vim.cmd.GitConflictNextConflict, 'Next Conflict' },
      p = { vim.cmd.GitConflictPrevConflict, 'Prev Conflict' },
      j = { vim.cmd.GitConflictChooseTheirs, 'Conflict choose theirs' },
      f = { vim.cmd.GitConflictChooseOurs, 'Conflict choose ours' },
      b = { vim.cmd.GitConflictChooseBoth, 'Conflict choose both' },
    },
    p = { function() vim.cmd.Git 'pull' end, 'Pull' },
    P = { function() vim.cmd.Git 'push' end, 'Push' },
  },
  h = {
    name = 'Harpoon',
    a =  { function() require("harpoon.mark").add_file() end, 'Add file' },
    h =  { function() require("harpoon.ui").toggle_quick_menu() end, 'Quick menu' },
  },
  l = {
    name = 'lsp',
    f = { vim.lsp.buf.format, 'Format Buffer' },
  },
  P = {
    name = 'packer',
    s = { '<cmd>PackerSync<cr>', 'Sync' },
    i = { '<cmd>PackerInstall<cr>', 'Install' },
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
  -- ['<s-tab>'] = { vim.cmd.BufferLineCyclePrev, 'Prev buffer' },
  -- ['<tab>'] = { vim.cmd.BufferLineCycleNext, 'Next buffer' },
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
  ['<C-t>'] = { function() require'toggleterm'.toggle(nil, nil, nil, 'float') end, 'Terminal' },
  ['{'] = { '<C-^>', 'Prev file' },
})

wk.register({
  ['<'] = { '<gv', '' },
  ['>'] = { '>gv', '' },
  ['<s-tab>'] = { '<gv', '' },
  ['<tab>'] = { '>gv', '' },
  [','] = { ';', '' },
  [';'] = { ',', '' },
}, { mode = 'v' })

wk.register({
  p = { [["_dP]], 'Paste, no overwrite register' },
  d = { [["_d]], 'Delete, no overwrite register' },
}, {
  prefix = '<leader>',
  mode = 'v',
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

wk.register({
  ['<C-t>'] = { vim.cmd.ToggleTerm, 'Terminal' },
  ['<C-j>'] = { '<CMD>wincmd j<CR>', '' },
  ['<C-k>'] = { '<CMD>wincmd k<CR>', '' },
  ['<M-q>'] = { [[<C-\><C-n>]], '' },
}, { mode = 't' })
