set t_Co=256
set laststatus=2                                 " TODO
set noshowmode                                   " TODO
set guifont=Fira_Code:h15                        " MacVim specific font family and
set macligatures                                 " We want pretty symbols, when available
set linespace=4                                  " MacVim specific line-height
set guioptions-=l                                " Remove left-hand scrollbar
set guioptions-=L                                " Remove left-hand scrollbar (when there's a vsplit)
set guioptions-=r                                " Remove right-hand scrollbar
set guioptions-=R                                " Remove right-hand scrollbar (when there's a vsplit)
set guioptions-=e                                " Disable GUI tabs to avid wierd UI bugs
set showtabline=2                                " Always display the tabline to avid wierd UI bugs

if has("gui_macvim")
  " Disable Cmd+P native print key-binding
  " We'll re-map this to open a file navigation menu
  macmenu &File.Print key=<nop>
endif

if has("termguicolors")
  set termguicolors
endif

" Cmd-p Open fzf file navigation
nmap <D-p> :Files<cr>

" Ctrl+p Open CtrlP file navigation
nmap <C-p> :CtrlP<cr>

" Cmd+r Open CtrlP to serch tags (requires brew install ctags)
nmap <D-r> :CtrlPBufTag<cr>

" Cmd+e Open CtrlP to serch most recent files
nmap <D-e> :CtrlPMRUFiles<cr>
