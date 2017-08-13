"No Compatibility, very annoying on RH/Windows/MacOS
set nocompatible

" All Plugins!
call plug#begin()
" Colorscheme
Plug 'icymind/NeoSolarized'

" Utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'mattn/webapi-vim'

" Syntax files
Plug 'pangloss/vim-javascript'
Plug 'nono/jquery.vim'
Plug 'rust-lang/rust.vim'
Plug 'keith/swift.vim'
Plug 'othree/html5.vim'
Plug 'stanangeloff/php.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'hdima/python-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'udalov/kotlin-vim'

" Autocompletion
Plug 'benekastah/neomake'
Plug 'sbdchd/neoformat'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

if has("termguicolors")
    set termguicolors
endif

if !has("gui_running")
    set t_Co=256
endif


" Basic configuration
syntax on
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
set clipboard=unnamed
set number
set hidden
set ruler
set guioptions-=T
set shiftwidth=4
set tabstop=8
set smarttab
set expandtab
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
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib,*/venv,*/target
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
set relativenumber
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
colo NeoSolarized
set background=dark
let base16colorspace=256
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

" Configure Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(.pyc|class)$'
  \ }

" Enable Deoplete on startup
let g:deoplete#enable_at_startup = 1
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Configure Neomake
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--max-line-length=84']
    \ }
let g:neomake_echo_current_error=1
let g:neomake_verbose=0
let g:neomake_rust_enabled_makers = []

" Nerdtree keybindings
map <C-n> :NERDTreeToggle<CR>

" Configure Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_section_y = airline#section#create_right(['%{printf("%s%s",&fenc,&ff!="unix"?":".&ff:"")}'])
let g:airline_section_z = airline#section#create_right(['%3l:%2c'])
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#tabline#enabled = 1

" LSP config
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'javascript': ['/Users/wesleygahr/Development/required/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Some custom file configuration
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
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
