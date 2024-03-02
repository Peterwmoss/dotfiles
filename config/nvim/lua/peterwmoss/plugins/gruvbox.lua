return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {},
    config = function()
      require("gruvbox").setup({
        overrides = {
          SignColumn = { bg = "none" },
        }
      })
    end
  },
}
