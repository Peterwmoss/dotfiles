local defaultGroup = vim.api.nvim_create_augroup('DefaultGroup', { clear = true })

-- vim.api.nvim_create_autocmd('BufWinLeave', {
--   group = defaultGroup,
--   pattern = { '*.*' },
--   callback = function()
--     local buf = vim.api.nvim_win_get_buf(0)
--     if not vim.bo[buf].readonly then
--       vim.cmd [[ mkview! ]]
--     end
--   end
-- })

-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   group = defaultGroup,
--   pattern = { '*.*' },
--   callback = function()
--     vim.cmd [[ silent! loadview ]]
--   end
-- })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = defaultGroup,
  pattern = { '*' },
  callback = function()
    vim.cmd [[ silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100} ]]
  end
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = defaultGroup,
  pattern = { '*' },
  callback = function()
    vim.cmd [[ silent! lua vim.cmd.highlight("CursorLine guibg=#313131") ]]
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = defaultGroup,
  pattern = { '*' },
  callback = function()
    vim.cmd [[ checktime ]]
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = defaultGroup,
  pattern = { "*.tex" },
  callback = function()
    vim.cmd [[ setlocal filetype=tex ]]
  end
})
