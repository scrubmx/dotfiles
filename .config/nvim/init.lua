vim.g.mapleader = ','

-- TODO: Not sure if we need this at all
vim.cmd([[
  filetype plugin indent on
  syntax on
]])

vim.opt.title = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.sidescroll = 10

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 4

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.wildignore = { '*/cache/*', '*/tmp/*' }

vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '➞ ', extends = '◣', precedes = '◢', nbsp = '○' }

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.lazyredraw = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300

require('autocmds')
require('plugins')
require('keymaps')
