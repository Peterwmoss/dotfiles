return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        -- Configuration here, or leave empty to use defaults
        font = "Hack Nerd Font Mono=34;Noto Color Emoji=34",

        to_clipboard = true,
      })
    end
  },
}
