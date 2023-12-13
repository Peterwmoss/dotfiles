require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "c",
    "lua",
    "rust",
    "typescript",
    "go",
    "yaml",
    "cmake",
    "dockerfile",
    "c_sharp",
    "cpp",
    "json",
    "html",
    "css",
    "rego",
    "latex",
    "bash",
    "make",
    "vue",
    "scss",
  },

  sync_install = false,

  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
