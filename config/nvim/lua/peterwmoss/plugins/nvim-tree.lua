return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local WIDTH_RATIO = 0.3  -- You can change this too

      require('nvim-tree').setup({
        diagnostics = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
          timeout = 200,
        },
        hijack_netrw = true,
        reload_on_bufenter = true,
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        sync_root_with_cwd = true,
        sort_by = "name",
        on_attach = "disable",
        view = {
          relativenumber = true,
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
      })
    end
  },
}
