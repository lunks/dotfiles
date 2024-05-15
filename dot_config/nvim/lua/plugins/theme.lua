return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true,         -- do not set background color
        dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'lifepillar/vim-gruvbox8',
    lazy = true
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function ()
      require 'gruvbox'.setup {
        contrast = 'hard',
        dim_inactive = true,
        transparent_mode = true,
      }
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
