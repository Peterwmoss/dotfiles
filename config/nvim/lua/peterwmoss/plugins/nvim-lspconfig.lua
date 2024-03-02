return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufEnter',
    dependencies = {
      { 'onsails/lspkind.nvim' },
      { 'mfussenegger/nvim-jdtls' },
      { 'williamboman/mason.nvim' },
      { "williamboman/mason-lspconfig.nvim" },
      { 'hrsh7th/nvim-cmp' },
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require('cmp')
      local luasnip = require("luasnip")

      cmp.setup {
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
        sources = cmp.config.sources({
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

      require('mason').setup({
        ui = { border = 'rounded' }
      })

      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'jdtls',
          'gopls',
          'tsserver',
          'dockerls',
          'omnisharp@v1.39.8',
          'volar',
        },
      }

      local lspconfig = require('lspconfig')

      local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = lsp_cmds,
        desc = 'LSP actions',
        callback = function()
          local buf_map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = true })
          end

          buf_map("n", "ga", vim.lsp.buf.code_action)
          buf_map("n", "gd", vim.lsp.buf.definition)
          buf_map("n", "gD", vim.lsp.buf.declaration)
          buf_map("n", "gi", vim.lsp.buf.implementation)
          buf_map("n", "gr", function()
            require 'telescope.builtin'.lsp_references {
              layout_strategy = 'center',
              layout_config = {
                prompt_position = 'bottom',
                preview_cutoff = 0,
              },
              fname_width = 100,
            }
          end)

          buf_map("n", "K", vim.lsp.buf.hover)
          buf_map("", "<leader>lsh", vim.lsp.buf.signature_help)

          buf_map("n", "dl", vim.diagnostic.open_float)
          buf_map("n", "dn", vim.diagnostic.goto_next)
          buf_map("n", "dp", vim.diagnostic.goto_prev)

          buf_map("n", "<leader>lr", vim.lsp.buf.rename)
          buf_map("n", "<F2>", vim.lsp.buf.rename)

          vim.cmd.highlight('DiagnosticSignWarn guibg=NONE guifg=#ffcc00')
          vim.cmd.highlight('DiagnosticSignError guibg=NONE guifg=#e60000')
          vim.cmd.highlight('DiagnosticSignInfo guibg=NONE guifg=#99ccff')
          vim.cmd.highlight('DiagnosticSignHint guibg=NONE guifg=#33ccff')
          vim.cmd.highlight('DiagnosticSignOk guibg=NONE guifg=#33cc33')
        end
      })

      -- START templ
      vim.filetype.add {
        extension = {
          templ = "templ"
        }
      }
      local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      treesitter_parser_config.templ = treesitter_parser_config.templ or {
        install_info = {
          url = "https://github.com/vrischmann/tree-sitter-templ.git",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "master",
        },
      }
      vim.treesitter.language.register('templ', 'templ')
      local configs = require 'lspconfig.configs'
      if not configs.templ then
        configs.templ = {
          default_config = {
            cmd = { "templ", "lsp" },
            filetypes = { 'templ' },
            root_dir = require "lspconfig.util".root_pattern("go.mod", ".git"),
            settings = {},
          },
        }
      end
      -- END templ

      local default_handler = function(server)
        lspconfig[server].setup {}
      end

      require('mason-lspconfig').setup_handlers({
        default_handler,
        ['jdtls'] = function() end
      })

      lspconfig.templ.setup {}

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

      sign({ name = 'DiagnosticSignError', text = '✘' })
      sign({ name = 'DiagnosticSignWarn', text = '▲' })
      sign({ name = 'DiagnosticSignHint', text = '⚑' })
      sign({ name = 'DiagnosticSignInfo', text = '' })

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
    end
  },
}
