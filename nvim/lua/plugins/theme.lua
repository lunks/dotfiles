return {
  {
    'cryptomilk/nightcity.nvim',
    lazy = true
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function ()
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
