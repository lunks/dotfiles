return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'SirVer/ultisnips',
      'quangnguyen30192/cmp-nvim-ultisnips'
    },
    config = function ()
      local cmp = require 'cmp'

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      cmp.setup {
        snippet = {
          expand = function (args)
            vim.fn['UltiSnips#Anon'](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = function (fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
              fallback()
            end
          end,
          ['<Esc>'] = function (fallback)
            cmp.mapping.abort()
            fallback()
          end,
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
        }
      }
    end,
  },
}
