colorscheme Tomorrow-Night  " awesome colorscheme
syntax enable               " enable syntax processing

set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4
set expandtab               " tabs are spaces
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
"set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set viminfo^=%              " Remember info about open buffers on close
"set smarttab
"set smartindent
"set expandtab
""set autoindent
set nowrap                  " Don't wrap lines
set tags=tags
set splitright              " Default to split to the right
set splitbelow              " Default to split below

" Indent multiple lines in visual mode with tab key
vmap <Tab> >
vmap <S-Tab> <

" Easy escaping to normal mode
imap jj <esc>


" display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Force encoding to utf-8
set fileencoding=utf-8
set encoding=utf-8

let mapleader=","           " leader is comma

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Using tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>ez :tabe ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Resize vertical splits
nmap <C-v> :vertical resize +5<CR>


" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Automatically remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType javascript,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

"----------------------------------------------
" Vundle.vim
"----------------------------------------------

set nocompatible                     " be iMproved, required
filetype off                         " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim    " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'          " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'           " a tree explorer plugin for vim
Plugin 'StanAngeloff/php.vim'          " up-to-date PHP syntax file
Plugin 'powerline/powerline'
Plugin 'ctrlpvim/ctrlp.vim'            " Full path fuzzy file, buffer, tag, ... finder
Plugin 'ervandew/supertab'             " Supertab allows you to use <Tab> for insert completion
Plugin 'tpope/vim-endwise'             " Helps to end certain structures automatically
Plugin 'jiangmiao/auto-pairs'          " Insert or delete brackets, parens, quotes in pairs
Plugin 'terryma/vim-multiple-cursors'  " Sublime Text style multiple selections for vim
Plugin 'tpope/vim-vinegar'             " Better directory browser

call vundle#end()                    " required
filetype plugin indent on            " required
filetype indent on

"----------------------------------------------
" NERDTree
"----------------------------------------------

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

map <leader>n :NERDTreeToggle<CR>

source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

"autocmd vimenter * silent! lcd %:p:h

"----------------------------------------------
" CtrlP
"----------------------------------------------

" Change the default mapping and the default command
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Set its local working directory according to this variable
" see :https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Exclude files and directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Open files in new tabpages
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

