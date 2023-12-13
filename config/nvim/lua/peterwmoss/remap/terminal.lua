local M = {}

local cmd = vim.cmd

local addMapping = function(binding, mapping, opts)
  vim.keymap.set('t', binding, mapping, opts)
end

M.setup = function(opts)
  -- Toggle terminal
  addMapping('<C-t>', cmd.ToggleTerm)

  -- Window commands
  addMapping('<C-j>', '<CMD>wincmd j<CR>')
  addMapping('<C-k>', '<CMD>wincmd k<CR>')

  -- Enter normal mode
  addMapping('<M-q>', [[<C-\><C-n>]])
end

return M
