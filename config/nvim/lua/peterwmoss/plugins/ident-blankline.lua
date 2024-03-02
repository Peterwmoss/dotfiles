return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = 'BufEnter',
    main = "ibl",
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = {
            "dashboard",
            "lspinfo",
            "checkhealth",
            "man",
            "help",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "",
          }
        }
      })
    end,
  },
}
