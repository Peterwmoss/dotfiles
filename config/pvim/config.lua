-- Your preferred leader key
pvim.leader = "space"

-- Your preferred colorscheme, this one, among others, has treesitter support
pvim.colorscheme = "onenord"

pvim.extensions = {
  -- { name = "Peterkmoss/example-pennyvim-extension" },
}

-- Add custom plugins
pvim.custom_plugins = {
  { "tpope/vim-dispatch" },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end,
  },
  {
    "xiyaowong/telescope-emoji.nvim",
    requires = "nvim-telescope/telescope.nvim",
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    requires = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'towolf/vim-helm'
  },
  {
    'rmehri01/onenord.nvim',
  },
  {
    'monsonjeremy/onedark.nvim',
    branch = 'treesitter',
  },
  {
    'arcticicestudio/nord-vim',
  },
}

pvim.custom_mappings = {
  { mode = "n", comb = "<C-P>", mapping = ':SourcePennyVim<CR>:PackerSync<CR>', options = { noremap = true } },

  { mode = "n", comb = "{", mapping = '<C-^>', options = { noremap = true } },

  -- , to ; and vice versa
  { mode = "n", comb = ",", mapping = ";", options = { noremap = true } },
  { mode = "n", comb = ";", mapping = ",", options = { noremap = true } },
  { mode = "v", comb = ",", mapping = ";", options = { noremap = true } },
  { mode = "v", comb = ";", mapping = ",", options = { noremap = true } },

  -- To keep it consistent
  { mode = "n", comb = "Y", mapping = "y$", options = { noremap = true } },

  -- Fewer keystrokes
  { mode = "n", comb = "cw", mapping = "ciw", options = { noremap = true } },

  -- Tab to indent in visual mode
  { mode = "v", comb = "<tab>", mapping = ">gv", options = { noremap = true } },
  { mode = "v", comb = "<s-tab>", mapping = "<gv", options = { noremap = true } },

  -- Use space-o to to open file
  { mode = "n", comb = "<leader>o", mapping = ":e<space>", options = { noremap = true } },

  -- Searching is centered
  { mode = "n", comb = "n", mapping = "nzz", options = { noremap = true } },
  { mode = "n", comb = "N", mapping = "Nzz", options = { noremap = true } },

  -- Joining lines don't fuck with cursor
  { mode = "n", comb = "J", mapping = "mzJ`z", options = { noremap = true } },

  -- Better undo
  { mode = "i", comb = ",", mapping = ",<c-g>u", options = { noremap = true } },
  { mode = "i", comb = ".", mapping = ".<c-g>u", options = { noremap = true } },
  { mode = "i", comb = "!", mapping = "!<c-g>u", options = { noremap = true } },
  { mode = "i", comb = "?", mapping = "?<c-g>u", options = { noremap = true } },

  -- Moving text
  { mode = "v", comb = "J", mapping = ":m '>+1<CR>gv=gv", options = { noremap = true } },
  { mode = "v", comb = "K", mapping = ":m '<-2<CR>gv=gv", options = { noremap = true } },
  { mode = "i", comb = "<c-j>", mapping = "<esc>:m .+1<CR>==", options = { noremap = true } },
  { mode = "i", comb = "<c-k>", mapping = "<esc>:m .-2<CR>==", options = { noremap = true } },
  { mode = "n", comb = "<leader>j", mapping = ":m .+1<CR>==", options = { noremap = true } },
  { mode = "n", comb = "<leader>k", mapping = ":m .-2<CR>==", options = { noremap = true } },

  -- Better mark navigation
  { mode = "n", comb = "'", mapping = "`", options = { noremap = true } },

  -- Easy go to matching parentheses
  { mode = "n", comb = "å", mapping = "%", options = { noremap = true } },

  -- Copy all
  { mode = "n", comb = "yA", mapping = "m'ggyG`'zz", options = { noremap = true } },
}

pvim.custom_settings = {
  spelllang = { "da", "en_us" },
  background = "dark",
  colorcolumn = "100",
}

pvim.custom_variables = function()
end

pvim.custom_autocommands = {
  "BufWritePost *.tex :silent! Start! pdflatex -interaction=nonstopmode main.tex ; [[ -a main.bcf ]] && biber main ; pdflatex -interaction=nonstopmode main.tex; latexmk -c main.tex",
  'TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}',
  'FileType netrw nmap <buffer> <leader>x :Rexplore<CR>',
  'VimEnter,BufEnter Chart.yaml,values.yaml,templates/*.yaml setfiletype helm',
  'VimEnter,BufEnter Chart.yaml,values.yaml,templates/*.yaml lua require("custom-init").checkHelm()',
}

pvim.custom_init.dap = function()
end
