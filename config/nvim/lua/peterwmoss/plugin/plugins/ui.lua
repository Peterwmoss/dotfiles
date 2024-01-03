local M = {}

M.plugins = {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    }
  },

  { 'nvim-telescope/telescope-ui-select.nvim' },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "lukas-reineke/indent-blankline.nvim" },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  { "sindrets/diffview.nvim" },

  { 'echasnovski/mini.nvim', version = '*' },
}

return M
