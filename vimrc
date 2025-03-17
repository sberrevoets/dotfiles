filetype plugin indent on                 " Also required in neovim for lua ftplugin detection

syntax on                                 " Enable syntax highlighting


set autoindent                            " Match line indent from previous line
set autoread                              " Automatically update with changes
set backspace=indent,eol,start            " Backspace over lines, indents, and insert start
set breakindent                           " Indent wrapped lines
set breakindentopt=shift:4                " How much to indent wrapped lines
set clipboard=unnamed                     " Use system clipboard
set cursorline                            " Highlight current line
set expandtab                             " Replace tabs with spaces
set gdefault                              " Globally replace by default
set hlsearch                              " Highlight search terms
set ignorecase                            " Use case insensitive search
set incsearch                             " Show search terms as you type
set laststatus=0                          " Hide the file name bar
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
set textwidth=0                           " Number of columns before wrapping
set visualbell                            " No beeping please

" Create a directory if it doesn't exist yet
function! s:EnsureDirectory(directory)
  if !isdirectory(expand(a:directory))
    call mkdir(expand(a:directory), 'p')
  endif
endfunction

let s:subdir = "vim"
if has('nvim')
  let s:subdir = "nvim"
endif

set undolevels=2000
set undofile
let &undodir = $HOME . "/.tmp/" . s:subdir . "/undo"
call s:EnsureDirectory(&undodir)

set backup
let s:backupdir = $HOME . "/.tmp/" . s:subdir . "/backup"
set backupdir=$HOME/.tmp/
call s:EnsureDirectory(&backupdir)

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

" Join without space
nnoremap J Jx

" Easier quickfix jumps
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Delete file and buffer
nnoremap <Leader>d :call delete(expand('%'))<CR>

" Easy go-to-line navigation (<line number> + return)
nnoremap <CR> G
vnoremap <CR> G

" Conflict marker navigation
nnoremap <silent> ]c /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
nnoremap <silent> [c ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

" Easy find and replace
vnoremap <Leader>re "hy:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>
nnoremap <Leader>re :%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" commentary
map <Leader>/ <Plug>Commentary

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

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main'}
Plug 'hrsh7th/cmp-path', { 'branch': 'main'}
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main'}
Plug 'keith/swift.vim'
Plug 'keith/tmux.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/vim-expand-region'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-autoformat/vim-autoformat'
call plug#end()

if !has('nvim')
    colo catppuccin-mocha
endif
