vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.title = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.colorcolumn = '120'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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
-- vim.opt.foldlevel = 10
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = '0' -- Using ufo provider this prevents showing weird characters on the left
vim.opt.foldlevel = 99   -- Using ufo provider needs a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.opt.wildignore = { '*/cache/*', '*/tmp/*' }

vim.opt.list = true
vim.opt.listchars = { trail = '·', tab = '➞ ', extends = '◣', precedes = '◢', nbsp = '○' }

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.lazyredraw = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- vim.opt.spelllang = { 'en_us', 'es' }
-- vim.opt.spell = true

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.loader.enable()

require('config.lazy')
require('config.autocmds')
require('config.keymaps')

vim.opt.rtp:append('/usr/local/opt/fzf')
