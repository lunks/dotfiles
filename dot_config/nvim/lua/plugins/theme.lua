return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        transparent = true, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      })
    end
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    'lifepillar/vim-gruvbox8',
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require 'gruvbox'.setup {
        contrast = 'hard',
        dim_inactive = true,
        transparent_mode = true,
      }
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
