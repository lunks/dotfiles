return {
  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
    build = 'make install_jsregexp',
    config = function()
      require 'luasnip'.setup {}
      require 'luasnip.loaders.from_vscode'.lazy_load {}
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require 'cmp'

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
      local has_words_before = function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ''):sub(cursor[2], cursor[2]):match
            '%s'
      end

      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<Esc>'] = function(fallback)
            cmp.mapping.abort()
            fallback()
          end,
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          -- { name = 'cmdline' },
        }
      }
    end,
  },
}
