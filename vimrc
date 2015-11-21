syntax on               " Enable syntax highlighting

set autoindent          " Match line indent from previous line
set autoread            " Automatically update with changes
set showmatch           " Show matching parenthesis
set hlsearch            " Highlight search terms
set incsearch           " Show search terms as you type
set ignorecase          " Use case insensitive search
set smartcase           " Use case sensitive search for non-lowercase searches
set expandtab           " Replace tabs with spaces
set number              " Enable line numbers
set numberwidth=3       " Line gutter width
set shiftwidth=4        " Indentation in spaces
set showcmd             " Show current command on command line
set softtabstop=4       " Number of columns per tab
set textwidth=80        " Number of columns before wrapping

highlight LineNr ctermfg=238
if exists('+colorcolumn')
    execute "set colorcolumn=" . join(map(range(1, 259), '"+" . v:val'), ',')
    highlight ColorColumn guibg=#2d2d2d ctermbg=233
endif

" Use w!! for saving new files
ca w!! w !sudo tee "%"

" Use system pasteboard
if has('clipboard')
    set clipboard=unnamed

    if has('unnamedplus')
        set clipboard+=unnamedplus
    endif
endif
