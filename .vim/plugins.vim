"----------  Vundle  ----------"

filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
" set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'StanAngeloff/php.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'

call vundle#end()

filetype plugin indent on
