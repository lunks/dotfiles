return {
  'cryptomilk/nightcity.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function ()
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
