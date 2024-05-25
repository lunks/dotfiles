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
    'aznhe21/actions-preview.nvim',
    keys = { 'gf' },
    config = function()
      local actions_preview = require 'actions-preview'
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
        ensure_installed = { 'lua_ls', 'jsonls' }
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

      local handlers = {
        function(server_name)
          local server = require("lspconfig")[server_name]
          server.setup {
            on_attach = on_attach,
          }
        end,
        -- Next, you can provide targeted overrides for specific servers.
        ["rust_analyzer"] = function()
          require("rust-tools").setup {}
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
        ["clangd"] = function()
          local cmp_nvim_lsp = require "cmp_nvim_lsp"
          lspconfig.clangd.setup {
            on_attach = on_attach,
            capabilities = cmp_nvim_lsp.default_capabilities(),
            cmd = {
              "clangd",
              "--offset-encoding=utf-16",
            }
          }
        end,
      }

      -- alt 1. Either pass handlers when setting up mason-lspconfig:
      require("mason-lspconfig").setup({ handlers = handlers })
      require 'mason'.setup()
      require 'mason-lspconfig'.setup()

      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
      vim.keymap.set('n', '<space>r', vim.lsp.codelens.run)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    end,
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "rshkarin/mason-nvim-lint",
    config = function()
      require 'mason-nvim-lint'.setup({ quiet_mode = true })
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    filetypes = { "elixir", "heex" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")
      local lspformat = require 'lsp-format'

      elixir.setup {
        nextls = {
          enable = true,
          init_options = {
            experimental = {
              completions = {
                enable = true
              }
            }
          }
        },
        credo = { enable = true },
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
