" Plugins
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'tribela/vim-transparent'
call plug#end()

" General
set nocompatible
set autoindent
set number
set autoread
set backspace=indent,eol,start
set cursorline
set expandtab
set laststatus=1
set ruler
set wrap
set noshowmode
set tabstop=2
set hidden
set nobackup
set nowritebackup
set updatetime=300
verbose imap <tab>

" Colors, Font, Syntax
set t_Co=256
colorscheme despacio
filetype plugin indent on
set encoding=UTF-8
set syntax
syntax enable

" NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Airline.
let g:airline_theme='hybrid'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#formatter= 'default'
let g:airline#extensions#tabline#show_tabs = 1

"End Airline

" IndentLines
let g:indentLine_enabled = 1
let g:indentLine_setColor = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0

" HexoKinase
let g:Hexokinase_highlighters = ['sign_column']
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprevious<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-e> :w<CR>
nnoremap <C-f> :q!<CR>
