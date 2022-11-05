if pvim.leader == " " or pvim.leader == "space" then
  vim.g.mapleader = " "
else
  vim.g.mapleader = pvim.leader
end

local function apply(record)
  for _, mapping in ipairs(record) do
    vim.api.nvim_set_keymap(mapping.mode, mapping.comb, mapping.mapping, mapping.options)
  end
end

local mappings = {
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

  -- Tab to indent in visual mode
  { mode = "v", comb = "<tab>", mapping = ">gv", options = { noremap = true } },
  { mode = "v", comb = "<s-tab>", mapping = "<gv", options = { noremap = true } },

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
  { mode = "n", comb = "'", mapping = "`", options = {} },

  -- Copy all
  { mode = "n", comb = "yA", mapping = "m'ggyG`'zz", options = {} },

  { mode = "n", comb = "<C-h>", mapping = "<C-w>h", options = {} },
  { mode = "n", comb = "<C-j>", mapping = "<C-w>j", options = {} },
  { mode = "n", comb = "<C-k>", mapping = "<C-w>k", options = {} },
  { mode = "n", comb = "<C-l>", mapping = "<C-w>l", options = {} },

  { mode = "v", comb = "<", mapping = "<gv", options = { noremap = true } },
  { mode = "v", comb = ">", mapping = ">gv", options = { noremap = true } },
}

apply(mappings)

if vim.g.vscode then
  local vscodeSpecific = {
    { mode = "n", comb = "<tab>", mapping = ":tabn<cr>", options = {} },
    { mode = "n", comb = "<S-tab>", mapping = ":tabp<cr>", options = {} },
    { mode = "n", comb = "<leader>d", mapping = ":tabc<cr>", options = {} },

    { mode = "n", comb = "<leader>o", mapping = ":e<cr>", options = {} },

    { mode = "n", comb = "<leader>w", mapping = ":w<cr>", options = {} },
  }
  apply(vscodeSpecific)
else
  local terminalSpecific = {
    { mode = "n", comb = "<tab>", mapping = ":buffernext<cr>", options = { noremap = true } },
    { mode = "n", comb = "<S-tab>", mapping = ":bufferprev<cr>", options = { noremap = true } },

    -- Show errors, etc
    { mode = "n", comb = "<leader>tt", mapping = ":TroubleToggle<CR>", options = { noremap = true } },

    -- Move buffers around
    { mode = "n", comb = "<leader>bl", mapping = ":BufferLineMoveNext<cr>", options = { noremap = true } },
    { mode = "n", comb = "<leader>bh", mapping = ":BufferLineMovePrev<cr>", options = { noremap = true } },

    -- Use space-o to to open file
    { mode = "n", comb = "<leader>o", mapping = ":e<space>", options = { noremap = true } },

    -- Change word
    { mode = "n", comb = "cn", mapping = "*``cgn", options = { noremap = true } },
    { mode = "n", comb = "cN", mapping = "*``cgN", options = { noremap = true } },
  }
  apply(terminalSpecific)
end


