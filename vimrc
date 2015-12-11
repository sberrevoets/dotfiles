syntax on               " Enable syntax highlighting

set autoindent          " Match line indent from previous line
set autoread            " Automatically update with changes
set clipboard=unnamed   " Use system clipboard
set expandtab           " Replace tabs with spaces
set hlsearch            " Highlight search terms
set ignorecase          " Use case insensitive search
set incsearch           " Show search terms as you type
set nostartofline       " Don't reset cursor to start of line when moving
set number              " Enable line numbers
set numberwidth=3       " Line gutter width
set relativenumber      " Show line numbers relative to current line
set scrolloff=5         " Scroll when nearing window border
set shiftwidth=4        " Indentation in spaces
set showcmd             " Show current command on command line
set showmatch           " Show matching parenthesis
set showmode            " Show current mode
set smartcase           " Use case sensitive search for non-lowercase searches
set softtabstop=4       " Number of columns per tab
set textwidth=80        " Number of columns before wrapping

" Force using h, j, k, l. We'll see how it goes...
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

highlight LineNr ctermfg=238
if exists('+colorcolumn')
    execute "set colorcolumn=" . join(map(range(1, 259), '"+" . v:val'), ',')
    highlight ColorColumn guibg=#2d2d2d ctermbg=233
endif

" Use w!! for saving new files
ca w!! w !sudo tee "%"

