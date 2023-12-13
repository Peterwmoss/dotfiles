local M = {}

local function addMapping(binding, mapping, opts)
  vim.keymap.set('i', binding, mapping, opts)
end

M.setup = function(opts)
  -- Add more undo-points
  addMapping('<cr>', '<cr><c-g>u')
  addMapping(',', ',<c-g>u')
  addMapping('.', '.<c-g>u')
  addMapping('!', '!<c-g>u')
  addMapping('?', '?<c-g>u')
end

return M
