syntax on                                 " Enable syntax highlighting

set autoindent                            " Match line indent from previous line
set autoread                              " Automatically update with changes
set backspace=indent,eol,start            " Backspace over lines, indents, and insert start
set backupdir=~/dotfiles/vim/backupdir//  " Set directory for backup files
set breakindent                           " Indent wrapped lines
set breakindentopt=shift:4                " How much to indent wrapped lines
set clipboard=unnamed                     " Use system clipboard
set expandtab                             " Replace tabs with spaces
set gdefault                              " Globally replace by default
set hlsearch                              " Highlight search terms
set ignorecase                            " Use case insensitive search
set incsearch                             " Show search terms as you type
set noerrorbells                          " No beeping please
set nojoinspaces                          " Don't add spaces when using J
set nostartofline                         " Don't reset cursor to start of line when moving
set number                                " Enable line numbers
set numberwidth=3                         " Line gutter width
set relativenumber                        " Show line numbers relative to current line
set ruler                                 " Show column
set scrolloff=10                          " Scroll when nearing window border
set shiftwidth=4                          " Indentation in spaces
set showcmd                               " Show current command on command line
set showmatch                             " Show matching parenthesis
set showmode                              " Show current mode
set smartcase                             " Use case sensitive search for non-lowercase searches
set softtabstop=4                         " Number of columns per tab
set textwidth=80                          " Number of columns before wrapping
set undodir=~/dotfiles/vim/undodir//      " Set directory for persistent undo files
set undofile                              " Save undos after closing file
set visualbell                            " No beeping please

" Use space as leader
let mapleader = "\<Space>"

" Sane behavior please
nnoremap Y y$

" Allow pasting multiple times
xnoremap p pgvy

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

" Conflict marker navigation
nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

" Ctrl P
nnoremap <Leader>o :CtrlP<CR>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" commentary
map <Leader>/ <Plug>Commentary

" incsearch improvements (g/ doesn't move cursor)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Clear search easily
nmap <silent> <Leader>/ :nohlsearch<CR>

" De-emphasize line numbers
hi LineNr ctermfg=238

" Search highlighting
hi Search ctermbg=30
hi IncSearch ctermbg=30

" Highlight all columns after the text width
execute "set colorcolumn=" . join(map(range(1, 259), '"+" . v:val'), ',')
hi ColorColumn guibg=#2d2d2d ctermbg=233

" Use w!! for saving new files
ca w!! w !sudo tee "%"

" Save file when the window/pane loses focus
autocmd BufLeave,FocusLost * silent! wall

let g:line_length = 79
if filereadable('.black')
    autocmd BufWritePre *.py execute ':silent Black'
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ambv/black'
Plug 'commentary.vim'
Plug 'ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'keith/swift.vim'
Plug 'keith/tmux.vim'
Plug 'ledger/vim-ledger'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-expand-region'
Plug 'wellle/targets.vim'
call plug#end()
