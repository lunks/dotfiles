require'nvim-treesitter.configs'.setup({
  ensure_installed = {"ruby", "lua", "vim", "javascript", "typescript"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
})
