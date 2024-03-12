return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      { 'theHamsta/nvim-dap-virtual-text' },
    },
    config = function()
      require('dapui').setup({
        icons = {
          expanded = "",
          collapsed = "",
          current_frame = ""
        },
      })

      require('nvim-dap-virtual-text').setup()

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

      dap.configurations.java = {
        {
          type = 'java',
          request = 'attach',
          name = 'Debug (Attach) - Remote',
          hostName = '127.0.0.1',
          port = 5005,
        }
      }
    end
  },
}
