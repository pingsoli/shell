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
" ========================== Generic Setting ==========================
set nu                  " Show line number
set ruler               " Show current cursor's positin (rows, cols)
set background=dark     " Background color, default dark
set encoding=utf-8      " Encoding, default utf-8
set wrap                " Auto Wrapup
set mouse=c             " Command line (mouse=a allows mouse operation)
set smartcase
set autoindent          " Auto-indent
set expandtab           " Expand tab with whitesapce
set tabstop=2           " Use 2 whitespace to expand tab
set softtabstop=2       " Use 2 whitespace to expand tab
set shiftwidth=2        " Use 2 whitespace to expand tab
"set backspace=eol,start,indent  " Set backspace to delete a character

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
" ======================== Generic Setting  End =======================

" ======================= Searching Settting ==========================
set showmatch           " Show all matching (searching)
set ignorecase          " Ignore case when searching or mathcing
set incsearch           " Increse search when searching
set hlsearch            " Hightlight the searching or matching
" F5 will find the next occurrence after vimgrep
map <F5> :cp!<CR>
" F6 will find the previous occurrence after vimgrep
map <F6> :cn!<CR>
" F8 search for word under the cursor recursively
" :copen , to close -> :ccl
nnoremap <F8> :grep! "\<<cword>\>" . -r<CR>:copen 33<CR>
" use perl regexes
noremap / /\v
" ===================== Searching Settting End ========================

" ========================= NERDTree Plugin ===========================
let mapleader = ","
" Using ,ne to show NERDTree Plugin
map <leader>ne :NERDTree<CR>

" Used for C++ syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" ======================= NERDTree Plugin End =========================

" ====================== Coding Highlight Plugin =======================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
" ======================================================================

" =========================== Programming =============================
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
set cmdheight=2
set shortmess=a

" Used for running current python script
nn ,py :r! python %

" C, C++ header file add macro automatically
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef __" . gatename . "__"
  execute "normal! o#define __" . gatename . "__"
  execute "normal! Go#endif /* __" . gatename . "__ */"
  execute "normal! 2Go"
  write
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" ========================= Programming END ===========================
EOF
