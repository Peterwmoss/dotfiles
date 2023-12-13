local cmd = vim.cmd

local create_augroup = function(autocmds, name)
  cmd("augroup " .. name)
  cmd("au!")
  for _, au in ipairs(autocmds) do
    cmd("au " .. au)
  end
  cmd("augroup END")
end

local autocommands = {
  "BufRead,BufNewFile *.tex setlocal filetype=tex",
  "BufWinLeave *.* mkview!",
  "BufWinEnter *.* silent! loadview",
  'TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}',
}

create_augroup(autocommands, "DefaultGroup")
