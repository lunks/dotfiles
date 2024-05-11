-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/nvim-neotest/neotest
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

-- nnoremap <F5> :TestNearest<CR>
-- nnoremap <F6> :TestFile<CR>

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
    "nvim-neotest/nvim-nio"
  },
  keys = {
    '<F5>', '<F6>'
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-rspec")
      },
    })
    vim.keymap.set('n', '<F5>', function() neotest.run.run() end)
    vim.keymap.set('n', '<F6>', function() neotest.run.run(vim.fn.expand("%")) end)
  end
}
