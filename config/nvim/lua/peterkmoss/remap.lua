vim.g.mapleader = " "

vim.keymap.set("n", "<leader>x", "mz<cmd>Ex<CR>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Up down is centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over stuff without losing registry
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>e", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>.", "<cmd>so<CR>")

vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("n", "<tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<s-tab>", vim.cmd.BufferLineCyclePrev)

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "<s-tab>", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<tab>", ">gv")

vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

vim.keymap.set("n", "sv", vim.cmd.vnew)
vim.keymap.set("n", "sh", vim.cmd.new)

-- , to ; and vice versa
vim.keymap.set("n", ",", ";", { noremap = true })
vim.keymap.set("n", ";", ",", { noremap = true })
vim.keymap.set("v", ",", ";", { noremap = true })
vim.keymap.set("v", ";", ",", { noremap = true })

-- To keep it consistent
vim.keymap.set("n", "Y", "y$", { noremap = true })

-- Fewer keystrokes
vim.keymap.set("n", "cw", "ciw", { noremap = true })

-- Searching is centered
vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })

-- Joining lines  ck with cursor
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })

-- Better undo
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true })

-- Better mark na
vim.keymap.set("n", "'", "`", { noremap = true })

-- Easy go to matching parentheses
vim.keymap.set("n", "å", "%", { noremap = true })

-- Copy entire file
vim.keymap.set("n", "yA", "m'ggyG`'zz", { noremap = true })

-- Easy rename file
vim.keymap.set("n", "<leader>n", function ()
  local new_name = vim.fn.input({
    prompt = "New name > ",
    default = vim.fn.bufname(),
    cancelreturn = "",
  })

  if new_name == "" then
    return
  end

  local old_name = vim.fn.bufname()
  vim.cmd.saveas({ args = { new_name } })
  os.remove(old_name)
  vim.cmd.bdelete({ args = { old_name } })
end)
