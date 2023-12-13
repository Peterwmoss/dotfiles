local M = {}

local addMapping = function(binding, mapping, opts)
  vim.keymap.set('', binding, mapping, opts)
end

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  if opts.leader == nil then
    vim.g.mapleader = " "
  else
    vim.g.mapleader = opts.leader
  end

  -- Go to start of line
  addMapping('q', '^')

  -- Go to end of line
  addMapping('å', '$')

  -- Matching parentheses
  addMapping('ø', '%')

  -- Nordic layout, this is more intuitive
  addMapping(',', ';')
  addMapping(';', ',')

  -- Hop mappings
  addMapping('f', function()
    require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })
  end, {remap=true})
  addMapping('F', function()
    require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })
  end, {remap=true})
  addMapping('t', function()
    require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, {remap=true})
  addMapping('T', function()
    require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, {remap=true})

  local modules = {
    require("peterwmoss.remap.normal"),
    require("peterwmoss.remap.visual"),
    require("peterwmoss.remap.insert"),
    require("peterwmoss.remap.terminal"),
  }

  for _, module in pairs(modules) do
    module.setup(opts)
  end
end

return M
