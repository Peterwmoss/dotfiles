local M = {}

local modules = {
  require("peterwmoss.remap.normal"),
  require("peterwmoss.remap.visual"),
  require("peterwmoss.remap.insert"),
  require("peterwmoss.remap.terminal"),
}

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  if opts.leader == nil then
    vim.g.mapleader = " "
  else
    vim.g.mapleader = opts.leader
  end

  for _, module in pairs(modules) do
    module.setup(opts)
  end
end

return M
