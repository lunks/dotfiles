return {
  {
    'terrortylor/nvim-comment',
    keys = {
      {
        '<leader><space>',
        ':CommentToggle<CR>',
        mode = { 'n', 'v' },
        silent = true
      },
    },
    cmd = 'CommentToggle',
    config = function()
      local comment = require 'nvim_comment'
      comment.setup {}
    end
  },
}
