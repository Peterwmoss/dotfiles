if vim.g.vscode then
    -- VSCode extension
else
  vim.cmd [[packadd packer.nvim]]

  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
      "npxbr/gruvbox.nvim",
      requires = { "rktjmp/lush.nvim" },
    }
    use {
      "windwp/nvim-autopairs",
      config = function()
        require "core/autopairs"
      end,
      event = "BufWinEnter",
    }
    use {
      "tpope/vim-dispatch"
    }
    use {
    }
  end)

  require('lualine').setup {
    options = { theme = 'gruvbox' },
  }
end

require "config"
require "keymaps"
require "settings"
require "autocommands"
