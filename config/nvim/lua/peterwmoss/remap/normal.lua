local M = {}

M.addMapping = function(binding, mapping, opts)
  vim.keymap.set('n', binding, mapping, opts)
end

M.addLeaderMapping = function(binding, mapping, opts)
  M.addMapping('<leader>' .. binding, mapping, opts)
end

local function add_no_leader_mappings()
  -- Center cursor on jumps
  M.addMapping('<C-d>', '<C-d>zz')
  M.addMapping('<C-u>', '<C-u>zz')
  M.addMapping('n', 'nzz')
  M.addMapping('N', 'Nzz')

  -- Format
  M.addMapping('<C-f>', vim.lsp.buf.format)

  -- Window
  M.addMapping('<C-h>', '<C-w>h')
  M.addMapping('<C-j>', '<C-w>j')
  M.addMapping('<C-k>', '<C-w>k')
  M.addMapping('<C-l>', '<C-w>l')

  -- Nordic layout, this is more intuitive
  M.addMapping(',', ';')
  M.addMapping(';', ',')

  -- Fix joining lines
  M.addMapping('J', 'mzJ`z')

  -- Better previous file
  M.addMapping('{', '<C-^>')

  -- Yanking
  M.addMapping('yA', "m'ggyG`'zz")
  M.addMapping('y', 'y$')

  -- Toggle a terminal
  M.addMapping('<C-t>', function() require'toggleterm'.toggle(nil, nil, nil, 'float') end)
end

local function add_leader_mappings()
  M.addLeaderMapping('e', function()
    require("nvim-tree.api").tree.toggle({ find_file = true, })
  end)
end

M.setup = function(opts)
  add_no_leader_mappings()
  add_leader_mappings()
end

return M
