local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'dockerls',
  'gopls',
  'angularls',
  'bashls',
  'cmake',
  'cssls',
  'gradle_ls',
  'html',
  'jedi_language_server',
  'jsonls',
  'marksman',
  'texlab',
  'volar',
  'yamlls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-i>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- vim.keymap.set("n", "<leader>lws", vim.lsp.buf.workspace_symbol, opts) Handled by telescope
  -- vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, opts) Handled by telescope
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
