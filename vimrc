syntax on
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set number
set numberwidth=3
set textwidth=80

highlight LineNr ctermfg=238
if exists('+colorcolumn')
    execute "set colorcolumn=" . join(map(range(1, 259), '"+" . v:val'), ',')
    highlight ColorColumn guibg=#2d2d2d ctermbg=233
endif


