vim.cmd([[ autocmd! BufRead,BufNewFile *.sql  call jinja#AdjustFiletype() ]])
