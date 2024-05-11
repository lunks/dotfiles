return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    keys = { '<Leader>b', '<Leader>t' },
    config = function()
      local actions = require 'telescope.actions'
      require 'telescope'.setup {
        defaults = {
          file_ignore_patterns= { 'node_modules', '_build',  'deps', 'tmp'},
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },
      }
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<Leader>b', builtin.buffers)
      vim.keymap.set('n', '<Leader>t', builtin.find_files)
      require 'telescope'.load_extension 'fzf'
    end,
  },
}
