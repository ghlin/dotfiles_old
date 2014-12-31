""""""""""""""""""""""""
"  last modified date  "
""""""""""""""""""""""""

function! LastModDate()
  if &modified
    let save_pos = getpos('.')
    silent! exec ":silent! 1,10s/modified   .*$/modified   " . strftime("%Y %b %d - %X") . "/g"
    call setpos('.', save_pos)
  endif
endfunction

autocmd BufWritePre,FileWritePre *.h,*.cc,*.cpp,*.c,*.hpp,*.cxx   call LastModDate()


