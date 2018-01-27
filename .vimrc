set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath^=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/tagbar
set runtimepath^=~/.vim/bundle/vim-airline
set runtimepath^=~/.vim/bundle/ctrlp.vim
set tags+=~/ctags_repo/tags

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Directory tree 
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
