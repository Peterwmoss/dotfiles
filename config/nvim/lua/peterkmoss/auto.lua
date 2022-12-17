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
  "FileType Makefile setlocal noexpandtab",
  "BufRead,BufNewFile *.tex setlocal filetype=tex",
  "BufWinLeave *.* mkview!",
  "BufWinEnter *.* silent! loadview",
  "BufWritePost *.tex :silent! Start! pdflatex -interaction=nonstopmode main.tex ; [[ -a main.bcf ]] && biber main ; pdflatex -interaction=nonstopmode main.tex; latexmk -c main.tex",
  'TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}',
  'FileType netrw nmap <buffer> <leader>x :Rexplore<CR>`z',
  'VimEnter,BufEnter Chart.yaml,values.yaml,templates/*.yaml setfiletype helm',
  'VimEnter,BufEnter Chart.yaml,values.yaml,templates/*.yaml lua require("custom-init").checkHelm()',
}

create_augroup(autocommands, "DefaultGroup")
