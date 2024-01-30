local function get_plugins()
  return {
    -- Colorscheme
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = true,
      opts = {},
    },

    -- Debug
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

    -- Lsp
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { "williamboman/mason-lspconfig.nvim" },
    { 'mfussenegger/nvim-jdtls' },

    -- Completions
    {
      'L3MON4D3/LuaSnip',
      version = "v2.*",
      build = "make install_jsregexp",
    },
    { 'saadparwaiz1/cmp_luasnip' },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'onsails/lspkind.nvim' },


    -- UI
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
