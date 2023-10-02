return {
  {
    'aznhe21/actions-preview.nvim',
    config = function ()
      vim.keymap.set({ 'v', 'n' }, 'gf', require 'actions-preview'.code_actions)
      require 'actions-preview'.setup {
        telescope = {
          sorting_strategy = 'ascending',
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = 'top',
            preview_cutoff = 20,
            preview_height = function (_, _, max_lines)
              return max_lines - 15
            end,
          },
        },
      }
    end
  },
  {
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function ()
      require 'mason'.setup()
      require 'mason-lspconfig'.setup {
        automatic_installation = true,
        ensure_installed = { 'lua_ls' }
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'lukas-reineke/lsp-format.nvim' },
    config = function ()
      local lspconfig = require 'lspconfig'
      local lspformat = require 'lsp-format'

      lspformat.setup {}

      local on_attach = lspformat.on_attach

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        on_init = function (client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
              Lua = {
                format = {
                  enable = true,
                },
                runtime = {
                  version = 'LuaJIT'
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                  }
                }
              }
            })

            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
          end
          return true
        end
      }
      lspconfig.tsserver.setup {
        on_attach = on_attach,
      }
      lspconfig.jsonls.setup {
        on_attach = on_attach,
      }
    end
  },
}
