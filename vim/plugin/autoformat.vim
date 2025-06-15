let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

augroup formatter
  autocmd!

  autocmd FileType lua autocmd BufWritePre <buffer> Autoformat
  autocmd FileType python autocmd BufWritePre <buffer> Autoformat
  autocmd FileType javascript,typescript autocmd BufWritePre <buffer> Autoformat
  autocmd FileType sh autocmd BufWritePre <buffer> Autoformat
  " TODO: this is pretty slow compared to EsLintFixAll, figure out why
  "autocmd FileType typescriptreact autocmd BufWritePre <buffer> Autoformat
augroup END

let g:formatdef_eslint = '"eslint-formatter ".shellescape(expand("%:p"))'
let g:formatters_typescriptreact = ['eslint']
