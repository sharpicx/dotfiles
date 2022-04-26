call plug#begin('~/.vim/plugged')
                Plug 'github/copilot.vim'
                Plug 'preservim/NERDtree'
                Plug 'vim-airline/vim-airline'
                "Plug 'vim-utils/vim-alt-mappings'
                Plug '907th/vim-auto-save'
                Plug 'vim-airline/vim-airline-themes'
                Plug 'tribela/vim-transparent'
                Plug 'mattn/emmet-vim'
                Plug 'neoclide/coc.nvim', { 'branch': 'release' }
                Plug 'ryanoasis/vim-devicons'
                Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
                Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
                Plug 'flazz/vim-colorschemes'
                Plug 'Yggdroot/indentLine'
                Plug 'frazrepo/vim-rainbow'
                Plug 'othree/html5.vim'
                Plug 'alvan/vim-closetag'
                Plug 'ccakes/stack.vim'
                Plug 'preservim/tagbar'
                Plug 'embark-theme/vim'
                Plug 'ghifarit53/tokyonight-vim'
                Plug 'mhinz/vim-startify'
                " Plug 'arzg/vim-colors-xcode'
call plug#end()

" common settings.
set history=1000
set number
set ruler
set nowritebackup
set updatetime=300
set shortmess+=c
set hidden
set expandtab
set cursorline
set nocompatible
set backup
set noshowmode
set laststatus=1
set backspace=indent,eol,start
filetype on
filetype plugin on
filetype indent on
set showcmd
set showmode
set showmatch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Colors
colorscheme embark
set encoding=UTF-8
set t_Co=256
syntax on
set termguicolors
set background=dark
let g:embark_terminal_italics = 1

" stack.vim
" here are hotkeys 
" C+N = StackNewWindow
" C+C = CloseWindow
" C+L = PromoteWindow

" rainbow
let g:rainbow_active = 1

let g:rainbow_load_separately = [
                \ [ '*.py' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
                \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
                \ [ '*.cpp'  , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
                \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
                \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"airline
let g:airline_theme = 'atomic'
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_section_z = airline#section#create(['linenr'])
let g:airline_skip_empty_sections = 1

" syntastic
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = 'E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" autosave plugin
"let g:auto_save_silent = 1
let g:auto_save = 1
"let g:auto_save = 0
augroup ft_markdown
                au!
                au FileType markdown let b:auto_save = 1
augroup END

"nerdtree
if exists('g:plugs["nerdtree"]')
autocmd StdinReadPre * let S:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeWinSize=30
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHighlightCursorline = 0
autocmd FileType nerdtree setlocal signcolumn=no
endif
let NERDTreeHighlightCursorline=0

" Custom icons for expandable/expanded directories.
let g:NERDTreeDirArrowCollapsible = '⬎'
let g:NERDTreeDirArrowExpandable = '⬏'

" Hide certain files and directories.
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']


" hexokinase
if exists('g:plugs["vim-hexokinase"]')
                let g:hexokinase_highlighters = [
                        \ 'virtual',
                        \ ]
                let g:Hexokinase_virtualText = ' '
                let g:Hexokinase_signIcon = ' '
                let g:Hexokinase_alpha_bg = '#292D3E'
                let g:Hexokinase_checkBoundary = 0
                let g:Hexokinase_optInPatterns = [
                        \'full_hex',
                        \'triple_hex',
                        \'rgba',
                        \'hsl',
                        \'hsla',
                        \] 
endif
autocmd VimEnter = HexokinaseTurnOn

" IndentLine
if exists('g:plugs["indentLine"]')
                let g:indentLine_showFirstIndentLevel = 1
                let g:indentLine_char = '│'
                let g:indentLine_first_char = '│'
                let g:indentLine_faster = 1
                let g:indentLine_color_term = 1
                let g:indentLine_color_gui = '#C93357'
                let g:indentLine_conceallevel = 2
                let g:indentLine_fileTypeExclude = [
                        \ 'help', 'nerdtree', 'startify', 'Preview','__doc__', 'peekaboo',
                        \ 'man', 'trans', 'fzf', 'markdown', 'json',
                        \ ]
                let g:indentLine_bufTypeExclude = [
                        \ 'help', 'terminal' 
                        \ ]
endif

" html5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
                \ 'typescript.tsx': 'jsxRegion,tsxRegion',
                \ 'javascript.jsx': 'jsxRegion',
                \ 'typescriptreact': 'jsxRegion,tsxRegion',
                \ 'javascriptreact': 'jsxRegion',
                \ }

" Shortcut for closing tags, default is '>'

let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''

let g:closetag_close_shortcut = '<leader>>'

" Tagbar
if exists('g:plugs["tagbar"]')
                let g:tagbar_autopreview      = 0
                let g:tagbar_indent           = 1
                let g:tagbar_show_linenumbers = 1
                let g:tagbar_show_visibility  = 1
                let g:tagbar_singleclick      = 1
                let g:tagbar_sort             = 1
                let g:tagbar_width = 35
                let g:airline#extensions#tagbar#enabled = 1
endif

" Startify
let g:head = [
            \
            \ ' ██▒   █▓ ██▓ ▄▄▄      ',
            \ '▓██░   █▒▓██▒▒████▄    ',
            \ ' ▓██  █▒░▒██▒▒██  ▀█▄  ',
            \ '  ▒██ █░░░██░░██▄▄▄▄██ ',
            \ '   ▒▀█░  ░██░ ▓█   ▓██▒',
            \ '   ░ ▐░  ░▓   ▒▒   ▓▒█░',
            \ '   ░ ░░   ▒ ░  ▒   ▒▒ ░',
          \]
let g:startify_custom_header = g:head

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   file']            },
          \ { 'type': 'dir',       'header': ['   dirs']            },
          \ { 'type': 'commands',  'header': ['   cmds']            },
          \ ]

let g:startify_files_number = 8
let g:startify_padding_left = 5
let g:startify_custom_indices = []
let g:startify_custom_indices = ['', '', '', '', '', '', '', '', '', '']

" Keybinding
execute "set <M-l>=\el"
execute "set <M-c>=\ec"
execute "set <M-z>=\ez>"
let mapleader=","

noremap <leader>n :NERDTreeFocus<CR>
noremap <C-n> :NERDTree<CR>
noremap <C-t> :NERDTreeToggle<CR>
noremap <C-f> :NERDTreeFind<CR>
noremap <F8>  :TagbarToggle<CR>

noremap <M-l> :bn<CR>
noremap <C-k> :bp<cr>

noremap <leader>q :bp<cr>:bd #<cr>
