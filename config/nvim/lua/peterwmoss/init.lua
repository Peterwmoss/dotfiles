require("peterwmoss.plugin")
require("peterwmoss.colors")
require("peterwmoss.set")
require("peterwmoss.auto")
require("peterwmoss.remap")

local M = {}

M.wipe_java_lsp_data = function()
  local workspaces = vim.fn.stdpath('data') .. '/site/java/workspace-root/*'
  os.execute('rm -rf ' .. workspaces)
  vim.cmd.JdtWipeDataAndRestart()
end

return M
