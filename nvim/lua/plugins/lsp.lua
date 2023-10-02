return {
  {
    'creativenull/efmls-configs-nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    lazy = true,
  },
  {
    'aznhe21/actions-preview.nvim',
    keys = { 'gf' },
    config = function()
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
    lazy = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    config = function()
      require 'mason'.setup()
      require 'mason-lspconfig'.setup {
        automatic_installation = true,
        ensure_installed = { 'lua_ls' },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'lukas-reineke/lsp-format.nvim' },
    config = function()
      local lspconfig = require 'lspconfig'
      local lspformat = require 'lsp-format'
      local languages = require 'efmls-configs.defaults'.languages()
      local efmls_config = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { '.git/' },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }

      require 'lspconfig'.efm.setup(vim.tbl_extend('force', efmls_config, {
        -- Pass your custom lsp config below like on_attach and capabilities
        --
        -- on_attach = on_attach,
        -- capabilities = capabilities,
      }))
      lspformat.setup {}

      local on_attach = lspformat.on_attach
      require 'mason'.setup()
      require 'mason-lspconfig'.setup()

      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
              not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc')
          then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
              Lua = {
                format = {
                  enable = true,
                },
                runtime = {
                  version = 'LuaJIT',
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              },
            })

            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
          end
          return true
        end,
      }
      lspconfig.tsserver.setup {
        on_attach = on_attach,
      }
      lspconfig.jsonls.setup {
        on_attach = on_attach,
      }
    end,
  },
}
