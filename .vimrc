set nocompatible

source ~/.vim/plugins.vim

let mapleader = ","

syntax enable
colorscheme tomorrow                  "Themes are stored in ~/.vim/colors directory

set backspace=indent,eol,start        "Make backspace behave like every other editor
set number                            "Precede each line with its line number
set expandtab                         "Tabs are converted to spaces
set cursorline                        "Highlight the line of the cursor
set nowrap                            "Do not wrap long lines
set incsearch                         "Highlight while typing a search command
set hlsearch                          "Highlight all search matches
set showmatch                         "Highlight matching [{()}]
set splitright                        "Default to split to the right
set splitbelow                        "Default to split below
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fileencoding=utf-8
set encoding=utf-8

"----------  Ctrl-P  ----------"

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"Open files in a new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

"---------- NERDTree ----------"

nmap <D-1> :NERDTreeToggle<cr>
nmap <leader>1 :NERDTreeToggle<cr>

"----------  Elixir  ----------"

let g:alchemist#elixir_erlang_src = "/usr/local/bin/elixir"

"----------  MacVim  ----------"

set t_Co=256
set laststatus=2
set background=dark
set guifont=Hack:h15
set linespace=2
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"----------  Syntax  ----------"

"highlight CursorLine cterm=NONE ctermbg=232
"highlight CursorLineNr ctermfg=172
"highlight LineNr ctermfg=240

"---------- Mappings ----------"

nmap <leader>ev :tabedit ~/.vimrc<cr>
nmap <leader><space> :nohlsearch<cr>
nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <D-S-Left> :tabprevious<cr>
nmap <D-S-Right> :tabnext<cr>

"Select characters/lines with arrow keys
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

"---------- Auto-Cmd ----------"

augroup custom
  "Clear all previous auto-commands
  autocmd!

  "Auto source the .vimrc file when saving
  autocmd BufWritePost .vimrc source %
augroup END
