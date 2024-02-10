vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

local setup_jdtls = function()
  local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
  local config_dir = jdtls_dir .. '/config_linux'
  local plugins_dir = jdtls_dir .. '/plugins'
  local java_dap = '/home/peter/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.50.0'

  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
  os.execute('mkdir -p ' .. workspace_dir)


  local config = {
    filetypes = { "java" },
    cmd = {
      'java',

      '-javaagent:' .. jdtls_dir .. '/lombok.jar',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      '-jar', vim.fn.glob(plugins_dir .. '/org.eclipse.equinox.launcher_*.jar', 1),
      '-configuration', config_dir,
      '-data', workspace_dir,
    },
    on_attach = function()
      require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end
  }

  local home = '/home/peter'
  local patterns = {
    java_dap .. '/com.microsoft.java.debug.plugin-*.jar',
    home .. '/git/vscode-java-test/server/*.jar',
  }
  local bundles = {}
  for _, jar_pattern in ipairs(patterns) do
    for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), '\n')) do
      table.insert(bundles, bundle)
    end
  end

  -- This is the new part
  config['init_options'] = {
    bundles = bundles,
    extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities,
    completion = {
      favoriteStaticMembers = {
        "org.junit.jupiter.api.Assertions.*",
        "org.mockito.ArgumentMatchers.*",
        "org.mockito.Mockito.*",
      },
    },
  }

  require('jdtls').start_or_attach(config)
end

setup_jdtls()

local dap = require('dap')
local util = require('jdtls.util')

dap.adapters.java = function(callback)
  util.execute_command({ command = 'vscode.java.startDebugSession' }, function(err0, port)
    assert(not err0, vim.inspect(err0))
    callback({
      type = 'server',
      host = '127.0.0.1',
      port = port,
    })
  end)
end
