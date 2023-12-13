local M = {}

M.addMapping = function (mode, binding, mapping, opts)
  vim.keymap.set(mode, binding, mapping, opts)
end

return M
