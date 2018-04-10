set nocompatible              " be iMproved, required
filetype off                  " required

" ======================================================================

" set the runtime path to include Vundle and initialize
set rtp^=~/.vim/bundle/Vundle.vim

" https://github.com/majutsushi/tagbar
set rtp^=~/.vim/bundle/tagbar

" https://github.com/vim-airline
set rtp^=~/.vim/bundle/vim-airline

" https://github.com/kien/ctrlp.vim
set rtp^=~/.vim/bundle/ctrlp.vim

" https://github.com/edkolev/tmuxline.vim
set rtp^=~/.vim/bundle/tmuxline.vim

" https://github.com/tpope/vim-fugitive
set rtp^=~/.vim/bundle/vim-fugitive

" https://github.com/junegunn/vim-easy-align
set rtp^=~/.vim/bundle/vim-easy-align

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
