local M = {}

M.plugins = {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  { 'tpope/vim-fugitive' },

  { 'windwp/nvim-autopairs' },

  {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
  },

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
