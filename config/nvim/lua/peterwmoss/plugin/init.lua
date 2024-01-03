local M = {}

local modules = {
  require("peterwmoss.plugin.plugin-loader"),
}

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  for _, module in ipairs(modules) do
    module.setup(opts)
  end
end

return M
