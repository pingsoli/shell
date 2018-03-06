set nocompatible              " be iMproved, required
filetype off                  " required

" ======================================================================

" set the runtime path to include Vundle and initialize
set runtimepath^=~/.vim/bundle/Vundle.vim

" https://github.com/majutsushi/tagbar
set runtimepath^=~/.vim/bundle/tagbar

" https://github.com/vim-airline
set runtimepath^=~/.vim/bundle/vim-airline

" https://github.com/kien/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

" https://github.com/edkolev/tmuxline.vim
set runtimepath^=~/.vim/bundle/tmuxline.vim

" https://github.com/tpope/vim-fugitive
set runtimepath^=~/.vim/bundle/vim-fugitive

" https://github.com/junegunn/vim-easy-align
set runtimepath^=~/.vim/bundle/vim-easy-align

" ======================================================================
" Directory Struture
" .vim
" ├── bundle
" │   ├── ctrlp.vim
" │   ├── nerdtree
" │   ├── nerdtree-git-plugin
" │   ├── tagbar
" │   ├── tmuxline.vim
" │   ├── vim-airline
" │   ├── vim-cpp-enhanced-highlight
" │   ├── vim-easy-align
" │   ├── vim-fugitive
" │   └── Vundle.vim
" └── syntax
"     └── cpp.vim
" ======================================================================

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

" ======================================================================
