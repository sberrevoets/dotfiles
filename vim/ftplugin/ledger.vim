set shiftwidth=2

let g:ledger_extra_options = '--pedantic --explicit --check-payees'
let g:ledger_align_at = 60
let g:ledger_default_commodity = '$'

inoremap <silent> <buffer> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>

autocmd BufWritePre *.ledger :LedgerAlign
