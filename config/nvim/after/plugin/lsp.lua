local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require("luasnip")

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
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
        -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources ({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'spell' },
    { name = 'luasnip' },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] ..
      " " .. vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        path = "[Path]",
        spell = "[Spell]",
      })[entry.source.name]
      return vim_item
    end
  },
  preselect = cmp.PreselectMode.None,
  completion = { completeopt = 'menu,menuone,noinsert,noselect' },
}

local servers = {
  'lua_ls',
  'tsserver',
  'dockerls',
  'omnisharp',
  'volar',
  'gopls',
}

require('mason').setup()
require('mason-lspconfig').setup{
  ensure_installed = servers,
}

local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
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
  end,
})

require('mason-lspconfig').setup_handlers {
  function (server)
    require('lspconfig')[server].setup{}
  end
}

local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_linux'
local plugins_dir = jdtls_dir .. '/plugins'

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute('mkdir -p ' .. workspace_dir)

lspconfig.jdtls.setup {
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
