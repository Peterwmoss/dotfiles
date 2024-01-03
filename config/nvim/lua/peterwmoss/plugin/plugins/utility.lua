local M = {}

M.plugins = {
  {
    'nvim-treesitter/nvim-treesitter',
  },

  { 'tpope/vim-fugitive' },

  { 'windwp/nvim-autopairs' },

  { 'numToStr/Comment.nvim' },

  { "tpope/vim-dispatch" },

  {
    "akinsho/toggleterm.nvim",
    version = '*',
  },

  { 'folke/which-key.nvim' },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'smoka7/hop.nvim',
    version = '*',
  },
}

return M
