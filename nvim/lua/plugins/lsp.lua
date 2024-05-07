return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    'folke/neodev.nvim',
    config = function()
      require("neodev").setup({
        library = {
          enabled = true,
          runtime = true,
          plugins = true,
          types = true,
        },
        setup_jsonls = true,
        lspconfig = true,
        pathStrict = true,
      })
    end
  },
  {
    'creativenull/efmls-configs-nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
  },
  {
    'aznhe21/actions-preview.nvim',
    keys = { 'gf' },
    config = function()
      local actions_preview = require'actions-preview'
      vim.keymap.set({ 'v', 'n' }, 'gf', actions_preview.code_actions)

      actions_preview.setup {
        telescope = {
          sorting_strategy = 'ascending',
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = 'top',
            preview_cutoff = 20,
            preview_height = function(_, _, max_lines)
              return max_lines - 15
            end,
          },
        },
      }
    end,
  },
  {
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require 'mason'.setup()
      require 'mason-lspconfig'.setup {
        automatic_installation = true,
        ensure_installed = { 'lua_ls', 'tsserver', 'jsonls' }
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    keys = { 'gd' },
    dependencies = { 'lukas-reineke/lsp-format.nvim' },
    config = function()
      local lspconfig = require 'lspconfig'
      local lspformat = require 'lsp-format'
      lspformat.setup {}
      local on_attach = lspformat.on_attach
      local capabilities = lspformat.capabilities

      require 'mason'.setup()
      require 'mason-lspconfig'.setup()

      lspconfig.vtsls.setup {
        on_attach = on_attach,
      }

      lspconfig.eslint.setup{
        on_attach = on_attach
      }

      local eslint = require('efmls-configs.linters.eslint')
      local prettier = require('efmls-configs.formatters.prettier_d')
      local languages = {
        typescript = { prettier },
      }

      local efmls_config = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { '.git/' },
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
      vim.keymap.set('n', '<space>r', vim.lsp.codelens.run)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references)

      lspconfig.tsserver.setup {
        on_attach = lspformat.on_attach,
      }
      lspconfig.jsonls.setup {
        on_attach = lspformat.on_attach,
      }
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")
      local lspformat = require 'lsp-format'

      elixir.setup {
        nextls = {enable = true, spitfire = true},
        credo = {enable = true},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = true,
            suggestSpecs = true
          },
          on_attach = function(client, bufnr)
            lspformat.on_attach(client, bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set('i', '<F8>', 'copilot#Accept("") . "<Esc>:w<CR>"', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<F6>', 'copilot#Previous()', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<F7>', 'copilot#Next()', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true
    end
  }
}
