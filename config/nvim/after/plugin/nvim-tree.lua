require("nvim-tree").setup({
  diagnostics = {
    enable = true,
  },
  hijack_netrw = false,
  sync_root_with_cwd = true,
  sort_by = "name",
  on_attach = "disable",
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 200,
  },
})


vim.keymap.set("n", "<leader>e", function() require("nvim-tree.api").tree.toggle({ find_file = true, }) end)
