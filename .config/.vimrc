"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

let g:mapleader=","

set nocompatible    " Use vim defaults instead of 100% vi compatibily
set nu rnu          " Absolute + Relative number simutaneously
set ruler           " Show current cursor's positin (rows, cols)
set encoding=utf-8
set nowrap          " Nowrap to navigate code
set mouse=c         " Command line (mouse=a allows mouse operation)

set hlsearch
set incsearch
hi Search cterm=NONE ctermfg=Red ctermbg=LightYellow
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

set smartcase
set autoindent
set expandtab       " Expand tab with whitesapce
set tabstop=2
set softtabstop=2   " Numbers of spaces
set shiftwidth=2

set background=dark " Background color, default dark
set t_Co=256        " Force vim into 256 color mode


" Folding
set nofoldenable        " not fold when opening a new file
set foldmethod=indent
set foldlevelstart=20
nnoremap <Space> za

" Allowing cursor moving in insert mode
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>

" Goto closing character
nnoremap <Leader>q %
nnoremap <C-h> 0
nnoremap <C-l> $

" Save current file
nnoremap <Leader>s :update<CR>

" Quick comment for CPP
vnoremap // :s:^://<CR>

" Highlight 80th line, and make it gray color
highlight ColorColumn ctermbg=gray
set colorcolumn=81


set list listchars=tab:\ \ ,trail:•

" Resolve performance problems (memory leak)
autocmd BufWinLeave * call clearmatches()

" Show less output message in vim
set cmdheight=1
set shortmess=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find current file and switch to the directory
nnoremap <silent> <Leader>c :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

let g:NERDTreeIgnore = [
  \ '\.o$[[file]]', '\.out$[[file]]', '\.swp$[[file]]', '\.png$[[file]]',
  \ '\.bin$[[dir]]', '\.git$[[dir]]' 
  \ ]
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode  = 2

" NERDTree use relative numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'
" open window as a new tab
let g:ctrlp_split_window = 0

" Ctrlp ignore build and CMakeFiles directories
set wildignore+=*/build/*,*/CMakeFiles/*

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(dir|git)$',
  \ 'file': '\v\.(a|bin|cmake|make|o|out|so|swp)$'
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
nnoremap <silent> <Leader>j :TagbarOpen fj<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" 2 relative line number, 0 don't show linenubmer, 1 absolute linenumbers
let g:tagbar_show_linenumbers = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
" let g:airline#extensions#tabline#fnamemod = ':t'
" show table number
" let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'z', 'error', 'warning' ]
  \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight cpp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight                  = 1
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_experimental_simple_template_highlight = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmuxline plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" program based on file type
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit Makefile using tabs substitute space
" Indent based on filetype
autocmd FileType make       setlocal noexpandtab
autocmd FileType make       setlocal list listchars=tab:>-
autocmd FileType html       setlocal shiftwidth=4 tabstop=4
autocmd FileType java       setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 tabstop=4

inoremap <silent> (     ()<left>
inoremap <silent> {     {}<left>
inoremap <silent> {<CR> {<CR>}<ESC>O
inoremap <silent> [     []<left>

" Shortcuts only for cpp, auto-complete closing characters
autocmd FileType cpp inoremap <buffer><silent> "      ""<left>
autocmd FileType cpp inoremap <buffer><silent> ";     "";<left><left>
autocmd FileType cpp inoremap <buffer><silent> (;     ();<left><left>
autocmd FileType cpp inoremap <buffer><silent> {<CR>  {<CR>}<ESC>O
autocmd FileType cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

autocmd FileType c inoremap <buffer><silent> "      ""<left>
autocmd FileType c inoremap <buffer><silent> ";     "";<left><left>
autocmd FileType c inoremap <buffer><silent> (;     ();<left><left>
autocmd FileType c inoremap <buffer><silent> {<CR>  {<CR>}<ESC>O
autocmd FileType c inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

" Run current script and read output to vim
autocmd FileType python nnoremap <buffer><silent> ,py :r! python %


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CppMain()
  call append(".", "}")
  call append(".", "  return 0;")
  call append(".", "{")
  call append(".", "int main(int argc, char** argv)")
  execute "normal! 2j"
endfunction

function TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

command! Cppmain        call CppMain()
command! TrimWhitespace call TrimWhitespace()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vim
" ├── bundle
" │   ├── ctrlp.vim
" │   ├── nerdtree
" │   ├── nerdtree-git-plugin
" │   ├── tagbar
" │   ├── tmuxline.vim
" │   ├── vim-airline
" │   ├── vim-easy-align
" │   └── vim-fugitive
" ├── plugin
" │   └── a.vim
" └── syntax
"     └── cpp.vim
"
" a.vim:   https://vim.sourceforge.io/scripts/script.php?script_id=31
" cpp.vim: https://github.com/octol/vim-cpp-enhanced-highlight/blob/master/after/syntax/cpp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/scrooloose/nerdtree
set rtp+=~/.vim/bundle/nerdtree
set rtp+=~/.vim/bundle/nerdtree-git-plugin

" https://github.com/kien/ctrlp.vim
set rtp+=~/.vim/bundle/ctrlp.vim

" https://github.com/majutsushi/tagbar
set rtp+=~/.vim/bundle/tagbar

" https://github.com/vim-airline
set rtp+=~/.vim/bundle/vim-airline

" https://github.com/edkolev/tmuxline.vim
set rtp+=~/.vim/bundle/tmuxline.vim

" https://github.com/tpope/vim-fugitive
set rtp+=~/.vim/bundle/vim-fugitive

" https://github.com/junegunn/vim-easy-align
set rtp+=~/.vim/bundle/vim-easy-align
