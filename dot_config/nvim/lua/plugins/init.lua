return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'gitsigns'.setup {
        signs = {
          add          = { text = '＋' },
          change       = { text = '˜' },
          delete       = { text = '－' },
          topdelete    = { text = '－' },
          changedelete = { text = '⋍' },
          untracked    = { text = '＋' },
        }
      }
    end
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      'sj', 'sk', 'ss'
    },
    opts = {
      use_default_keymaps = false,
    },
    config = function()
      local sj = require 'treesj'
      sj.setup()
      vim.keymap.set('n', 'sj', sj.split)
      vim.keymap.set('n', 'sk', sj.join)
      vim.keymap.set('n', 'ss', sj.toggle)
    end
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    'folke/neodev.nvim',
    opts = {
      pathStrict = true,
    }
  },
  {
    'AndrewRadev/switch.vim',
    keys = { '-' },
    cmd = 'Switch'
  },
  {
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      -- This option is required.
      vim.g['chezmoi#use_tmp_buffer'] = true
      -- add other options here if needed.
    end,
  },
}
