" arin sharpicx @ sharpicx.wtf
" not much coz im too new to vim.

" Plugins
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tek256/simple-dark'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'
call plug#end()

" General
set nocompatible
set autoindent
set number
set autoread
set backspace=indent,eol,start
set cursorline
set expandtab
set laststatus=2
set ruler
set wrap
set noshowmode
set tabstop=2

" Colors, Font, Syntax
colorscheme yeller
filetype indent on
set encoding=UTF-8
syntax enable

" NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Airline.
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" IndentLines
let g:indentLine_setColor = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_color_term = 230
let g:indentLine_char_list = '|'


nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
