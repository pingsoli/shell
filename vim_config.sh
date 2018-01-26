#!/bin/bash

# vim configure automatically
# 1) Installing vundle plugin manager
# 2) Installing NERDTree plugin
# 3) Install cpp highlight plugin
# 4) VIM configure

# NOTE: 1), 2), 3) is not added

# Required root permission
if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

vim_config_file="/etc/vim/vimrc.local"

cat >$vim_config_file << 'EOF'
filetype plugin indent on
" ========================== general setting ==========================
set nu rnu              " Absolute + Relative number simutaneously
set ruler               " Show current cursor's positin (rows, cols)
set background=dark     " Background color, default dark
set encoding=utf-8      " Encoding, default utf-8
set nowrap              " Nowrap to navigate code
set mouse=c             " Command line (mouse=a allows mouse operation)
set smartcase
set autoindent          " Auto-indent
set expandtab           " Expand tab with whitesapce
set tabstop=2           " Use 2 whitespace to expand tab
set softtabstop=2       " Use 2 whitespace to expand tab
set t_Co=256            " Force vim into 256 color mode
set shiftwidth=2        " Use 2 whitespace to expand tab

" Allowing cursor moving in insert mode
ino <C-H> <Left>
ino <C-L> <Right>
ino <C-J> <Down>
ino <C-K> <Up>

" In normal mode
" Goto the start or end of current line
nn <C-H> 0
nn <C-L> $

" Color the columns when overlength happened, max length is 73.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%73v.\+/

" ,s save current file
no ,s :update<CR>
" ,m show all bookmarks
nn ,m :marks<ENTER>

" Show all whitespace and tabs
set listchars=tab:>~,trail:.,nbsp:~
set list
" ======================== general setting  end =======================


" ======================= Searching Settting ==========================
set showmatch           " Show all matching (searching)
"set ignorecase          " Ignore case when searching or mathcing
"set incsearch           " Increse search when searching
"set hlsearch            " Hightlight the searching or matching
" ===================== Searching Settting End ========================


" ========================= nerdtree plugin ===========================
let mapleader = ","
" Using ,ne to show NERDTree Plugin
nn <leader>ne :NERDTree<CR>
" ,r to switch to directory tree
nn <leader>r  :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.o$', '\.swp$', '\.png']

" ======================= nerdtree plugin end =========================


" ========================== tagbar plugin ============================

let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
nmap <F8> :TagbarToggle<CR>
nn ,t :TagbarOpen j<CR>

" relative line number, 0 don't show linenubmer, 1 absolute linenumbers
let g:tagbar_show_linenumbers = 2

" ======================== tagbar plugin end ===========================


" ========================= airline plugin =============================

 let g:airline#extensions#default#layout = [
   \ [ 'a', 'b', 'c' ],
   \ [ 'z', 'error', 'warning' ]
   \ ]

" ======================= airline plugin end ===========================


" =========================== programming ==============================
" Indent for programming.
if has("autocmd")
  " If the filetype is Makefile then we need to use tabs.
  " so do not expand tabs into space.
  autocmd FileType make       set noexpandtab

  " Auto indent according to filetype, personal preference.
  autocmd FileType html       setlocal shiftwidth=4 tabstop=4
  autocmd FileType java       setlocal shiftwidth=4 tabstop=4
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType python     setlocal shiftwidth=4 tabstop=4
endif

" Auto-complete closing character
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

" Using make command requires twice comfiming, add cmdheight to
" show more message, set shortmess also can short the out message.
set cmdheight=1
set shortmess=a

" Used for running current python script
nn ,py :r! python %

" C, C++ header file add macro automatically
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef _" . gatename . "_"
  execute "normal! o#define _" . gatename . "_"
  execute "normal! Go#endif /* _" . gatename . "_ */"
  execute "normal! 2Go"
  write
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" ========================= programming end ===========================
EOF
# 20 ~ ... lines
# r! cat /etc/vim/vimrc.local
# press ':' and ctrl + r, then hit the " to run the above command
