CACHE_DIR = vim.fn.stdpath "cache"

local function apply(options)
  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

local default_options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect", "noinsert" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hidden = true,
  showmode = false,
  hlsearch = false,
  ignorecase = true,
  mouse = "",
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  writebackup = false,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 500,
  undodir = CACHE_DIR .. "/undo",
  undofile = true,
  updatetime = 50,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  autoindent = true,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4, -- default
  signcolumn = "yes",
  wrap = true,
  linebreak = true,
  viewoptions = { "folds", "cursor" },
  scrolloff = 8,
  spell = false,
}

apply(default_options)

if vim.g.vscode then
  local vscodeSpecific = {
  }
  apply(vscodeSpecific)
else
  local terminalSpecific = {
  }
  apply(terminalSpecific)
end

