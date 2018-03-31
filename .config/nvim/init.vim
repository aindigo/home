set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle"begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
""Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
""Plugin 'edkolev/tmuxline.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jansenm/vim-cmake'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rhysd/vim-clang-format'
Plugin 'moll/vim-bbye'
Plugin 'sukima/xmledit'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'stephpy/vim-yaml'
Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'
Plugin 'nanotech/jellybeans.vim'
Plugin 'zig-lang/zig.vim'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'critiqjo/lldb.nvim'
Plugin 'johngrib/vim-game-code-break'
Plugin 'dcharbon/vim-flatbuffers'
call vundle#end()
filetype plugin indent on

" nerdtree key

map <C-n> :NERDTreeToggle<CR>
map <F5> :YcmDiags<CR>
nnoremap <M-g> :YcmCompleter GoTo<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" line numbers and transparency
set nu
"set transparency=5
let NERDTreeShowHidden=1 

" tabs indent

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent


syntax on

set mouse=a
set background=dark
"let g:solarized_termcolors=256

colorscheme jellybeans 

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

autocmd BufNewFile,BufRead *.md set filetype=markdown
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929

"match OverLength /\%120v.\+/


au InsertEnter * set cul
au InsertLeave * set nocul

set clipboard=unnamed

" Change cursor shape between insert and normal mode in iTerm2.app
"
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif 

set fenc=utf-8
" set encoding=utf-8

set foldmethod=syntax
set foldlevelstart=99

let g:xmledit_enable_html=1
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags 
autocmd FileType html set foldmethod=indent

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set backspace=2 " make backspace work like most other apps

tnoremap <Esc> <C-\><C-n>

" navigate windows EZ
"#
tnoremap <A-h> <C-\><C-n><C-w>hi
tnoremap <A-j> <C-\><C-n><C-w>ji
tnoremap <A-k> <C-\><C-n><C-w>ki
tnoremap <A-l> <C-\><C-n><C-w>li
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

autocmd FileType h,hpp,c,cpp,objc nnoremap <M-c> :<C-u>ClangFormat<CR>
autocmd FileType h,hpp,c,cpp,objc vnoremap <M-c> :ClangFormat<CR>
let g:clang_format#detect_style_file = 1

let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

let airline#extensions#tabline#excludes = ['[Location List]']

set lazyredraw
