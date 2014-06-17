""""""""""""""""""""""""
"  last modified date  "
""""""""""""""""""""""""

function! LastModDate()
  if &modified
    silent! exec ":silent! 1,10s/modified   .*$/modified   " . strftime("%Y %b %d - %X") . "/g"
  endif
endfunction

autocmd BufWritePre,FileWritePre *.h,*.cc,*.cpp,*.c,*.hpp,*.cxx   ks|call LastModDate()|'s


