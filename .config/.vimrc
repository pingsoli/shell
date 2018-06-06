""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
let g:mapleader=","

" Use vim defaults instead of 100% vi compatibily
set nocompatible
" Absolute + Relative number simutaneously
set nu rnu
" Show current cursor's positin (rows, cols)
set ruler
set encoding=utf-8
set nowrap
set mouse=c

" Searching configuration
set hlsearch
set incsearch
highlight Search cterm=NONE ctermfg=black ctermbg=gray
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

set smartcase
set autoindent
" Expandtab with whitespace
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set background=dark
set t_Co=256

" Folding
" not fold when opening a new file
set nofoldenable
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find current file and switch to the directory
nnoremap <silent> <Leader>w :NERDTreeToggle<CR>
nnoremap <silent> <Leader>l :NERDTreeFind<CR>

let g:NERDTreeIgnore = [
  \ '\.o$[[file]]', '\.out$[[file]]', '\.swp$[[file]]', '\.png$[[file]]',
  \ '\.bin$[[dir]]', '\.git$[[dir]]' 
  \ ]
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode  = 2

" NERDTree use relative numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommeter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after commet delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let g:NERDCommetEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'rw'
"" open window as a new tab
"let g:ctrlp_split_window = 0
"
"" Ctrlp ignore build and CMakeFiles directories
"set wildignore+=*/build/*,*/CMakeFiles/*
"
"let g:ctrlp_custom_ignore = {
"  \ 'dir': '\v[\/]\.(dir|git)$',
"  \ 'file': '\v\.(a|bin|cmake|make|o|out|so|swp)$'
"  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
nnoremap <silent> <Leader>j :TagbarOpen fj<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" 2 relative line number, 0 don't show linenubmer, 1 absolute linenumbers
let g:tagbar_show_linenumbers = 2

set tags=./tags;,tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'z', 'error', 'warning' ]
  \ ]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight cpp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight                  = 1
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_experimental_simple_template_highlight = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmuxline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" program based on file type
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit Makefile using tabs substitute space, Indent based on filetype
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
autocmd FileType c,cpp inoremap <buffer><silent> "      ""<left>
autocmd FileType c,cpp inoremap <buffer><silent> ";     "";<left><left>
autocmd FileType c,cpp inoremap <buffer><silent> (;     ();<left><left>
autocmd FileType c,cpp inoremap <buffer><silent> {<CR>  {<CR>}<ESC>O
autocmd FileType c,cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

" Run current script and read output to vim
autocmd FileType python nnoremap <buffer><silent> ,py :r! python %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CppMain()
  call append("$", "int main(int argc, char *argv[])")
  call append("$", "{")
  call append("$", "  return 0;")
  call append("$", "}")
  norm 2j
endfunction

function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

command! Cppmain        call CppMain()
command! TrimWhitespace call TrimWhitespace()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_complete_in_comments=1
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

" Debug for youcompleteme
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

let g:ycm_semantic_triggers = {
  \ 'c,cpp' : ['re!\w{2}'],
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug (vim plugins manager)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugin manager downloader
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
call plug#end()
