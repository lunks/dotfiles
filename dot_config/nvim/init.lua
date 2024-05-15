vim.g.mapleader = ','

vim.opt.eventignore:append("FocusLost")
vim.o.wildmode = 'longest,list:longest,full'
vim.o.clipboard = 'unnamedplus'
vim.o.expandtab = true
vim.o.shell = 'zsh'
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.splitright = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.foldenable = false
vim.o.termguicolors = true
vim.opt.guicursor= "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,n:blinkwait15000-blinkoff700-blinkon1500,i-ci:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.o.timeoutlen = 450
vim.o.updatetime = 250
vim.g.python3_host_prog = '/usr/bin/python3'

vim.o.cursorline = true
vim.o.colorcolumn = '80'
vim.o.cmdheight = 2
vim.o.scrolloff = 5
vim.opt.listchars = {
  trail = '·',
  tab = '»·',
}
vim.o.pumblend = 30
vim.o.completeopt = 'noinsert,menuone'
vim.o.signcolumn = 'yes'
vim.o.number = true

vim.api.nvim_create_user_command('Remove', function()
  vim.cmd [[!rm %]]
  vim.cmd [[bd]]
end, { nargs = 0 })

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup('plugins', {
  change_detection = {
    notify = false
  }
})
