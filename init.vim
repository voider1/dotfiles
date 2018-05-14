" No Compatibility, very annoying on RH/Windows/MacOS
set nocompatible

" All Plugins!
call plug#begin()
" Colorscheme
Plug 'icymind/neosolarized'

" Utility
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'mattn/webapi-vim'
Plug 'rust-lang-nursery/rustfmt'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax files
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'pest-parser/pest.vim'
Plug 'vmchale/ion-vim'

" Autocompletion
Plug 'sbdchd/neoformat'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \}

call plug#end()

if has("termguicolors")
    set termguicolors
endif

if !has("gui_running")
    set t_Co=256
endif

colorscheme NeoSolarized
set background=dark
syntax on
set nowrap " Don't wrap lines
set tabstop=4 " Tabs are 4 spaces
set backspace=indent,eol,start " Allow backspacing over anything
set autoindent
set copyindent " Copy the previous indentation on auto indentation
set shiftwidth=4 " Number of spaces for auto indenting
set shiftround " Use multiple of shiftwidth when indenting with < and >
set showmatch " Show matching parenethesis
set smarttab " Insert tabs on the start of the line according to shiftwidth
set expandtab " Insert spaces instead of tabs
set cursorline " Highlight the line the cursor is on
set nofoldenable " No folding

set number
set hidden " Hide buffers instead of closing them
set hlsearch " Highlight search terms
set incsearch " Show mathces as you type
set gdefault " g flag on by default when searching
set fileformats=unix,dos,mac
filetype plugin indent on
set scrolloff=5 " Always have 5 lines above and below the cursor
set visualbell " Visual bell instead of beeping
set noerrorbells " Don't ring the error bells
set title
set titleold="Terminal"
set titlestring=%F
set relativenumber " Relative line numbering
let base16colorspace=256

set clipboard=unnamed " Use system clipboard
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib,*/venv,*/target " Ignore these while searching
set ttyfast " Make stuff faster
set autoread " Automatically reread file if changed outisde vim
set nobackup
set noswapfile
set pastetoggle=<F2>
set exrc " Enables reading .exrc in current directory

let mapleader="," " Change leader to ,
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent><Tab> :bn<CR>
nnoremap <silent><S-Tab> :bp<CR>
nnoremap <silent><leader>f :Files<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent><leader>t :%s/\s\+$//e<CR>

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd BufEnter * :syntax sync fromstart

" Configure fzf
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Nerdtree keybindings
map <C-n> :NERDTreeToggle<CR>

" Configure Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_section_y = airline#section#create_right(['%{printf("%s%s",&fenc,&ff!="unix"?":".&ff:"")}'])
let g:airline_section_z = airline#section#create_right(['%3l:%2c'])
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#tabline#enabled = 1

" Deoplete config
let g:deoplete#enable_at_startup = 1
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" run RustFmt on save
let g:rustfmt_autosave = 1

" LanguageClient-Neovim setup
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \}

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
