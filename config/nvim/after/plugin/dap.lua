require('dap-go').setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  dap.repl.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  dap.repl.close()
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition > ')) end)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dsi", dap.step_into)
vim.keymap.set("n", "<leader>dso", dap.step_over)
vim.keymap.set("n", "<leader>dt", dap.terminate)
vim.keymap.set("n", "<leader>do", dapui.open)
vim.keymap.set("n", "<leader>dk", function()
  dapui.close()
  dap.repl.close()
end)
