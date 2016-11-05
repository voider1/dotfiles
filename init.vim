"No Compatibility, very annoying on RH/Windows/MacOS
set nocompatible

" All Plugins!
call plug#begin()
Plug 'icymind/NeoSolarized'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'pangloss/vim-javascript'
Plug 'nono/jquery.vim'
Plug 'rust-lang/rust.vim'
Plug 'keith/swift.vim'
Plug 'applescript.vim'
Plug 'othree/html5.vim'
Plug 'stanangeloff/php.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'mitsuhiko/vim-python-combined'
Plug 'hdima/python-syntax'

Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/deoplete-padawan'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs'
Plug 'maksimr/vim-jsbeautify'
call plug#end()

" Fix tmux issues
if &term =~ '256color'
  set t_ut=
endif
set termguicolors

" Basic configuration
syntax on
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set number
set hidden
set ruler
set guioptions-=T
set shiftwidth=4
set tabstop=8
set smarttab
set expandtab
set background=dark
set fileformats=unix,dos,mac
filetype plugin indent on
set ttyfast
let mapleader=","
set scrolloff=5
set backspace=2
set nowrap
set showmatch
set autoindent
set copyindent
set hlsearch
set incsearch
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set visualbell
set gdefault
set autoread
set noerrorbells
set vb t_vb=
set nobackup
set noswapfile
set pastetoggle=<F2>
set cursorline
set title
set titleold="Terminal"
set titlestring=%F
set exrc
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
colo NeoSolarized 
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
set nofoldenable
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
tnoremap <Esc> <C-\><C-n>
autocmd! BufWritePost,BufEnter * Neomake
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd BufEnter * :syntax sync fromstart
map <C-n> :NERDTreeToggle<CR>

" Configure Nerd Tree, ignore some files and nice style
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$', '\.dSYM$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:netrw_liststyle=3

" Enable Deoplete on startup
let g:deoplete#enable_at_startup = 1
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Deoplete c_lang completion
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/3.8.1/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/3.8.1/lib/clang"

" Configure Neomake
let g:neomake_python_enabled_makers = ['flake8', 'python']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721',
    \ '--max-line-length=84']
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

" Configure Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_section_y = airline#section#create_right(['%{printf("%s%s",&fenc,&ff!="unix"?":".&ff:"")}'])
let g:airline_section_z = airline#section#create_right(['%3l:%2c'])
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#tabline#enabled = 1

" Some custom file configuration
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType php setlocal shiftwidth=4 tabstop=8 softtabstop=4 expandtab
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */
autocmd FileType css noremap <buffer> <leader>r :call CSSBeautify()<cr>
autocmd FileType scss setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=2 tabstop=8 softtabstop=2 expandtab
autocmd FileType java setlocal commentstring=//\ %s
autocmd FileType cs setlocal tabstop=8 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal commentstring=//\ %s
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,objc setlocal commentstring=//\ %s
let c_no_curly_error=1
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript noremap <buffer> <leader>r :call JsBeautify()<cr>
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
