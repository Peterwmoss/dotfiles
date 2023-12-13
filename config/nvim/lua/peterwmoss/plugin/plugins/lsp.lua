local M = {}

M.plugins = {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      {
        'mfussenegger/nvim-dap',
        name = 'dap',
      },
    },
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = { 'mfussenegger/nvim-dap' },
  },

  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { "williamboman/mason-lspconfig.nvim" },
  { 'mfussenegger/nvim-jdtls' },

  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp",
  },
  { 'saadparwaiz1/cmp_luasnip' },

  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer'   },
  { 'hrsh7th/cmp-path'     },
  { 'hrsh7th/cmp-cmdline'  },
  { 'hrsh7th/nvim-cmp'     },
}

return M
