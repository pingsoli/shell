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
" a.vim: https://vim.sourceforge.io/scripts/script.php?script_id=31
" cpp.vim: https://github.com/octol/vim-cpp-enhanced-highlight/blob/master/after/syntax/cpp.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" https://github.com/scrooloose/nerdtree
set rtp^=~/.vim/bundle/nerdtree
set rtp^=~/.vim/bundle/nerdtree-git-plugin


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

set nocompatible    " Use vim defaults instead of 100% vi compatibily
set nu rnu          " Absolute + Relative number simutaneously
set ruler           " Show current cursor's positin (rows, cols)
set encoding=utf-8  " Encoding, default utf-8
set nowrap          " Nowrap to navigate code
set mouse=c         " Command line (mouse=a allows mouse operation)
set smartcase
set autoindent      " Auto-indent
set expandtab       " Expand tab with whitesapce
set tabstop=2       " Use 2 whitespace to expand tab
set softtabstop=2   " Use 2 whitespace to expand tab
set shiftwidth=2    " Use 2 whitespace to expand tab
set background=dark " Background color, default dark
set t_Co=256        " Force vim into 256 color mode

let g:mapleader=","

" Folding
set foldmethod=indent
set nofoldenable        " not fold when opening a new file
set foldlevelstart=20   " Toggle folding
set foldlevel=20
nnoremap <Space>   za

" Allowing cursor moving in insert mode
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-J> <Down>
inoremap <C-K> <Up>

" Highlight 80th line, and make it gray color
highlight ColorColumn ctermbg=gray
set colorcolumn=80

" Save current file
no ,s :update<CR>

" Show all whitespace and tabs
set list listchars=trail:•

" Resolve performance problems (memory leak)
autocmd BufWinLeave * call clearmatches()

" Show less output message
set cmdheight=1
set shortmess=a

nmap <Leader>M %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> ,ne :NERDTree<CR>
" Find current file and switch to the directory
nnoremap <silent> ,f :NERDTreeFind<CR>
nnoremap <silent> ,c :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.o$', '\.swp$', '\.png$']
let NERDTreeShowHidden=1

" NERDTree use relative numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"autocmd BufWinEnter * NERDTreeFind


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = "/usr/local/ctags/bin/ctags"
nnoremap <silent> <C-J> :TagbarOpen fj<CR>
nnoremap <silent> ,t :TagbarToggle<CR>

" relative line number, 0 don't show linenubmer, 1 absolute linenumbers
let g:tagbar_show_linenumbers = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'z', 'error', 'warning' ]
  \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Ignore b[B]uild directory
set wildignore+=*/build/*,*/Build/*

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(dir|git)$',
  \ 'file': '\v\.(a|bin|cmake|make|o|out|so|swp)$'
  \ }


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
autocmd FileType make       set noexpandtab

" Indent based on filetype
autocmd FileType html       setlocal shiftwidth=4 tabstop=4
autocmd FileType java       setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 tabstop=4

" Shortcuts only for cpp, auto-complete closing characters
autocmd FileType cpp inoremap <buffer><silent> "      ""<left>
autocmd FileType cpp inoremap <buffer><silent> ";     "";<left><left>
autocmd FileType cpp inoremap <buffer><silent> (      ()<left>
autocmd FileType cpp inoremap <buffer><silent> (;     ();<left><left>
autocmd FileType cpp inoremap <buffer><silent> [      []<left>
autocmd FileType cpp inoremap <buffer><silent> {      {}<left>
autocmd FileType cpp inoremap <buffer><silent> {<CR>  {<CR>}<ESC>O
autocmd FileType cpp inoremap <buffer><silent> {;<CR> {<CR>};<ESC>O

" Run current script and read output to vim
autocmd FileType python nnoremap <buffer><silent> ,py :r! python %


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CppMain()
  call append("$", "int main(int argc, char** argv)")
  call append("$", "{")
  call append("$", "  return 0;")
  call append("$", "}")
  execute "normal! 2j"
endfunction
command Cppmain :call CppMain()
