-- Your preferred leader key
pvim.leader = "space"

-- Your preferred colorscheme, this one, among others, has treesitter support
pvim.colorscheme = "gruvbox"

pvim.extensions = {
  -- { name = "Peterkmoss/example-pennyvim-extension" },
}

-- Add custom plugins
pvim.custom_plugins = {
  { "tpope/vim-dispatch" },
}

pvim.custom_mappings = {
  -- , to ; and vice versa
  { mode = "n", comb = ",", mapping = ";", options = { noremap = true } },
  { mode = "n", comb = ";", mapping = ",", options = { noremap = true } },
  { mode = "v", comb = ",", mapping = ";", options = { noremap = true } },
  { mode = "v", comb = ";", mapping = ",", options = { noremap = true } },

  -- Dont replace when pasting over something
  { mode = "v", comb = "p", mapping = '"_dP', options = { noremap = true } },
  { mode = "v", comb = "P", mapping = '"_dlP', options = { noremap = true } },

  -- To keep it consistent
  { mode = "n", comb = "Y", mapping = "y$", options = { noremap = true } },

  -- Fewer keystrokes
  { mode = "n", comb = "cw", mapping = "ciw", options = { noremap = true } },

  -- Tab to indent in visual mode as well
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

  -- Change word
  { mode = "n", comb = "cn", mapping = "*``cgn", options = { noremap = true } },
  { mode = "n", comb = "cN", mapping = "*``cgN", options = { noremap = true } },
}

pvim.custom_settings = {
  spelllang = { "da", "en_us" },
  background = "dark",
}

pvim.custom_variables = function()
end

pvim.custom_autocommands = {
  "BufWritePost *.tex :silent! Start! pdflatex -interaction=nonstopmode main.tex ; [[ -a main.bcf ]] && biber main ; pdflatex -interaction=nonstopmode main.tex; latexmk -c main.tex",
  'TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}',
}

pvim.custom_init.dap = function()
  local dap = require "dap"

  -- Node adapter config
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/git/vscode-node-debug2/out/src/nodeDebug.js'},
  }

  -- Javascript
  dap.configurations.javascript = {
    {
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
  }

  -- Typescript
  dap.configurations.typescript = {
    {
      type = "node2",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector"
    }
  }
end