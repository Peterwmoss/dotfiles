local ts_builtin = require('telescope.builtin')
local nvim_tree = require("nvim-tree.api")
local toggle_term = require("toggleterm")
local dap, dapui = require("dap"), require("dapui")

local git = vim.cmd.Git
local cmd = vim.cmd
local lsp = vim.lsp

local M = {}

local addMapping = function(binding, mapping, opts)
  vim.keymap.set('n', binding, mapping, opts)
end

local addLeaderMapping = function(binding, mapping, opts)
  addMapping('<leader>' .. binding, mapping, opts)
end

local function add_no_leader_mappings()
  -- Center cursor on jumps
  addMapping('<C-d>', '<C-d>zz')
  addMapping('<C-u>', '<C-u>zz')
  addMapping('n', 'nzz')
  addMapping('N', 'Nzz')

  -- Format
  addMapping('<C-f>', lsp.buf.format)

  -- Window
  addMapping('<C-h>', '<C-w>h')
  addMapping('<C-j>', '<C-w>j')
  addMapping('<C-k>', '<C-w>k')
  addMapping('<C-l>', '<C-w>l')

  -- Fix joining lines
  addMapping('J', 'mzJ`z')

  -- Better previous file
  addMapping('{', '<C-^>')

  -- Yanking
  addMapping('yA', "m'ggyG`'zz")
  addMapping('Y', 'y$')

  -- Toggle a terminal
  addMapping('<C-t>', function()
    toggle_term.toggle(nil, nil, nil, 'float')
  end)
end

local function add_leader_mappings()
  -- Toggle file tree
  addLeaderMapping('e', function()
    nvim_tree.tree.toggle({ find_file = true, })
  end)

  -- Command pallette
  addMapping('<C-p>', ts_builtin.commands)

  -- Find lsp symbols
  addLeaderMapping('fS', ts_builtin.lsp_document_symbols)
  -- Find string
  addLeaderMapping('fs', ts_builtin.live_grep)

  -- Find file
  addLeaderMapping('ff', function()
    ts_builtin.find_files({
      hidden = true
    })
  end)

  -- Find git files
  addLeaderMapping('fg', function()
    ts_builtin.git_files({
      hidden = true,
      show_untracked = true,
    })
  end)

  -- Git status
  addLeaderMapping('gs', git)
  -- Git checkout branch
  addLeaderMapping('gB', ':Git checkout -b ')
  -- Git diff
  addLeaderMapping('gd', cmd.Gvdiffsplit)

  -- Git pull
  addLeaderMapping('gp', function()
    git('pull')
  end)

  -- Git push
  addLeaderMapping('gP', function()
    git('push')
  end)

  -- Git log
  addLeaderMapping('gl', function()
    git('log --graph --oneline')
  end)

  -- Git file blame
  addLeaderMapping('gfb', function()
    git('blame')
  end)

  -- Git branches
  addLeaderMapping('gb', ts_builtin.git_branches)

  -- Line comment
  addLeaderMapping('c', function()
    return vim.api.nvim_get_vvar('count') == 0 and '<Plug>(comment_toggle_linewise_current)'
    or '<Plug>(comment_toggle_linewise_count)'
  end, { expr = true })

  -- Git conflicts
  addLeaderMapping('n', cmd.GitConflictNextConflict)
  addLeaderMapping('p', cmd.GitConflictPrevConflict)
  addLeaderMapping('j', cmd.GitConflictChooseTheirs)
  addLeaderMapping('f', cmd.GitConflictChooseOurs)
  addLeaderMapping('b', cmd.GitConflictChooseBoth)

  -- Harpoon
  addLeaderMapping('h', require("harpoon.ui").toggle_quick_menu)
  addLeaderMapping('H', require("harpoon.mark").add_file)

  -- Format buffer
  addLeaderMapping('lf', lsp.buf.format)

  -- Open Lazy.nvim
  addLeaderMapping('L', cmd.Lazy)

  -- Save
  addLeaderMapping('w', cmd.w)

  -- Close window
  addLeaderMapping('q', cmd.q)

  -- Source current file
  addLeaderMapping('.', cmd.so)

  -- Debugging
  addLeaderMapping("db", dap.toggle_breakpoint)
  addLeaderMapping("dB", function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition > '))
  end)
  addLeaderMapping("dc", dap.continue)
  addLeaderMapping("dN", dap.step_into)
  addLeaderMapping("dn", dap.step_over)
  addLeaderMapping("dt", dap.terminate)
  addLeaderMapping("do", dapui.open)
  addLeaderMapping("dk", function()
    dapui.close()
    dap.repl.close()
  end)
end

M.setup = function(opts)
  add_no_leader_mappings()
  add_leader_mappings()
end

return M
