colorscheme Tomorrow-Night  " awesome colorscheme
syntax enable               " enable syntax processing

set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set viminfo^=%              " Remember info about open buffers on close
set smarttab
set autoindent
set smartindent


" Force encoding to utf-8
set fileencoding=utf-8
set encoding=utf-8

let mapleader=","           " leader is comma

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

"----------------------------------------------
" Vundle.vim
"----------------------------------------------

set nocompatible                     " be iMproved, required
filetype off                         " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim    " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'        " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'         " a tree explorer plugin for vim
Plugin 'StanAngeloff/php.vim'        " up-to-date PHP syntax file
Plugin 'powerline/powerline'

call vundle#end()                    " required
filetype plugin indent on            " required

"----------------------------------------------
" NERDTree
"----------------------------------------------

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map <leader>n :NERDTreeToggle<cr>


source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
