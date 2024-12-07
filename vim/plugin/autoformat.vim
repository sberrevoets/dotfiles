augroup formatter
  autocmd!

  autocmd FileType lua autocmd BufWritePre <buffer> Autoformat
  autocmd FileType python autocmd BufWritePre <buffer> Autoformat
  autocmd FileType javascript,typescript autocmd BufWritePre <buffer> Autoformat
augroup END
