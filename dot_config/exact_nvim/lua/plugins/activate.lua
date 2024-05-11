return {
  'roobert/activate.nvim',
  keys = {
    {
      '<leader>p',
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = 'Plugins',
    },
  }
}
