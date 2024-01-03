local M = {}

M.plugins = {
  -- {
  --   'rmehri01/onenord.nvim',
  --   priority = 1000,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  -- },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {},
  }
}

return M
