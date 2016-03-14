syntax on                      " Enable syntax highlighting

set autoindent                 " Match line indent from previous line
set autoread                   " Automatically update with changes
set backspace=indent,eol,start "Backspace over lines, indents, and insert start
set clipboard=unnamed          " Use system clipboard
set expandtab                  " Replace tabs with spaces
set hlsearch                   " Highlight search terms
set ignorecase                 " Use case insensitive search
set incsearch                  " Show search terms as you type
set nojoinspaces               " Don't add spaces when using J
set nostartofline              " Don't reset cursor to start of line when moving
set number                     " Enable line numbers
set numberwidth=3              " Line gutter width
set undofile                   " Save undos after closing file
set undodir=./vim/undodir      " Set directory for persistent undo files
set relativenumber             " Show line numbers relative to current line
set scrolloff=5                " Scroll when nearing window border
set shiftwidth=4               " Indentation in spaces
set showcmd                    " Show current command on command line
set showmatch                  " Show matching parenthesis
set showmode                   " Show current mode
set smartcase                  " Use case sensitive search for non-lowercase searches
set softtabstop=4              " Number of columns per tab
set textwidth=80               " Number of columns before wrapping

" Use space as leader
let mapleader = "\<Space>"

" Force using h, j, k, l. We'll see how it goes...
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" Easy writing/quitting
nnoremap W :write<CR>
nnoremap Q :quit<CR>

" Easier movement
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

nnoremap j gj
nnoremap k gk

" Easy go-to-line navigation (<line number> + return)
nnoremap <CR> G
vnoremap <CR> G

" Ctrl P
nnoremap <Leader>o :CtrlP<CR>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" commentary
map <Leader>/ <Plug>Commentary

" Clear search easily
nmap <silent> <Leader>/ :nohlsearch<CR>

highlight LineNr ctermfg=238
if exists('+colorcolumn')
    execute "set colorcolumn=" . join(map(range(1, 259), '"+" . v:val'), ',')
    highlight ColorColumn guibg=#2d2d2d ctermbg=233
endif

" Use w!! for saving new files
ca w!! w !sudo tee "%"

" Plugins

call plug#begin()
Plug 'commentary.vim'
Plug 'ctrlp.vim'
Plug 'keith/swift.vim'
Plug 'keith/tmux.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-expand-region'
Plug 'wellle/targets.vim'
call plug#end()
