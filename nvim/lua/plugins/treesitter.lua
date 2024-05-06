return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      require 'nvim-treesitter'.setup {}
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'ruby', 'lua', 'vim', 'javascript', 'typescript', 'tsx' },
        indent = {
          enable = true
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          use_languagetree = true
        },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
      }
    end
  },
}
