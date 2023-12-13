require "nvim_comment".setup()

vim.keymap.set("v", "<leader>c", ":CommentToggle<CR>")
vim.keymap.set("n", "<leader>c", vim.cmd.CommentToggle)
