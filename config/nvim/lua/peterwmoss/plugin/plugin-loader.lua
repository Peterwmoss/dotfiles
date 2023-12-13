local M = {}

local function get_plugins()
  local categories = {
    require("peterwmoss.plugin.plugins.utility"),
    require("peterwmoss.plugin.plugins.ui"),
    require("peterwmoss.plugin.plugins.colorschemes"),
    require("peterwmoss.plugin.plugins.lsp"),
  }

  local plugins = {}

  for _, category in pairs(categories) do
    for _, plugin in pairs(category.plugins) do
      table.insert(plugins, plugin)
    end
  end

  return plugins
end

M.setup = function(opts)
  if opts == nil then
    opts = {}
  end

  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup(get_plugins(), opts)
end

return M
