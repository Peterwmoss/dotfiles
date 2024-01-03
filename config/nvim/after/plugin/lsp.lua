local cmp = require('cmp')

cmp.setup{
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-i>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources ({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
}

local servers = {
  'lua_ls',
  'jdtls',
  'gopls',
  'tsserver',
  'dockerls',
  'omnisharp',
  'volar',
}

require('mason').setup({
  ui = {border = 'rounded'}
})

require('mason-lspconfig').setup{
  ensure_installed = servers,
}

local lspconfig = require('lspconfig')

local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_cmds,
  desc = 'LSP actions',
  callback = function()
    local buf_map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, {buffer = true})
    end

    buf_map("n", "ga", vim.lsp.buf.code_action)
    buf_map("n", "gd", vim.lsp.buf.definition)
    buf_map("n", "gD", vim.lsp.buf.declaration)
    buf_map("n", "gi", vim.lsp.buf.implementation)
    buf_map("n", "gr", function()
      require'telescope.builtin'.lsp_references{
        layout_strategy = 'center',
        layout_config = {
          prompt_position = 'bottom',
          preview_cutoff = 0,
        },
        fname_width = 100,
      }
    end)

    buf_map("n", "K", vim.lsp.buf.hover)
    buf_map("", "<C-i>", vim.lsp.buf.signature_help)

    buf_map("n", "dl", vim.diagnostic.open_float)
    buf_map("n", "dn", vim.diagnostic.goto_next)
    buf_map("n", "dp", vim.diagnostic.goto_prev)

    buf_map("n", "<leader>lr", vim.lsp.buf.rename)
    buf_map("n", "<F2>", vim.lsp.buf.rename)
  end
})

local default_handler = function (server)
  lspconfig[server].setup{ }
end

local jdtls_handler = function()
  local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
  local config_dir = jdtls_dir .. '/config_linux'
  local plugins_dir = jdtls_dir .. '/plugins'

  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
  os.execute('mkdir -p ' .. workspace_dir)

  lspconfig.jdtls.setup {
    filetypes = { "gradle", "java", "groovy" },
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

      '-jar', plugins_dir .. '/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar',
      '-configuration', config_dir,
      '-data', workspace_dir,
    },
  }
end

require('mason-lspconfig').setup_handlers({
  default_handler,
  ['jdtls'] = jdtls_handler
})

-------------------------------
-- DIAGNOSTICS CONFIGURATION --
-------------------------------
local sign = function(opts)
  -- See :help sign_define()
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

-- See :help vim.diagnostic.config()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

