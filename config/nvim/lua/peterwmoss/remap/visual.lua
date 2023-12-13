local M = {}

local addMapping = function(binding, mapping, opts)
  vim.keymap.set({ 'v', 'x' }, binding, mapping, opts)
end

local addLeaderMapping = function(binding, mapping, opts)
  addMapping('<leader>' .. binding, mapping, opts)
end

M.setup = function(opts)
  -- Indent
  addMapping('<', '<gv')
  addMapping('<tab>', '>gv')
  addMapping('>', '>gv')
  addMapping('<S-tab>', '<gv')

  -- Comments
  addLeaderMapping('cl', '<Plug>(comment_toggle_linewise_visual)')
  addLeaderMapping('cb', '<Plug>(comment_toggle_blockwise_visual)')

  -- Paste without overwriting default register
  addLeaderMapping('d', [["_d]])
  addLeaderMapping('p', [["_dP]])
end

return M
