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
  'tsserver',
  'dockerls',
  'omnisharp',
  'volar',
}

require('mason').setup()
require('mason-lspconfig').setup{
  ensure_installed = {
  'lua_ls',
  'tsserver',
  'dockerls',
  'volar',
  'omnisharp@v1.39.8',
  }
}

local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", function()
    require'telescope.builtin'.lsp_references{
      layout_strategy = 'center',
      layout_config = {
        prompt_position = 'bottom',
        preview_cutoff = 0,
      },
      fname_width = 100,
    }
  end, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

for _, server in ipairs(servers) do
  lspconfig[server].setup{
    on_attach = on_attach,
  }
end

local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_linux'
local plugins_dir = jdtls_dir .. '/plugins'

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute('mkdir -p ' .. workspace_dir)

lspconfig.jdtls.setup {
  on_attach = on_attach,
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

    '-jar', plugins_dir .. '/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
    '-configuration', config_dir,
    '-data', workspace_dir,
  },
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
