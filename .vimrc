set nocompatible

filetype on
filetype indent on
filetype plugin on

" Enable syntax highlighting
syntax enable
set background=dark

if has('gui_running')
    set guioptions-=T  " no toolbar
    colorscheme Tomorrow-Night-GVim
    hi Todo guifg=#40ffff guibg=#606060
    set lines=40 columns=125 linespace=0
else
    colorscheme Tomorrow-Night
endif


" Set to auto read when a file is changed from the outside
set autoread

" Searching configurations
set ignorecase
set smartcase
set incsearch
set hlsearch

" Text, tab and indent related
set smarttab
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Show matching brackets when text indicator is over them
set showmatch

" Force encoding to utf-8
set fileencoding=utf-8
set encoding=utf-8

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Always show current position
set ruler

" Turn on the WiLd menu
set wildmenu

" For autocompletion
set wildmode=list:longest

" Height of the command bar
set cmdheight=2

" Format the status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline+=%=%p%%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction