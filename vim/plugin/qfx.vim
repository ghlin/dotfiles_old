
"""""""""""""""""""""""""""""""""""""""""""
"  toggle quickfix windo - from vim wiki  "
"""""""""""""""""""""""""""""""""""""""""""


function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx . 'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty!"
      return
  endif
  let winnr = winnr()
  exec(a:pfx . 'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>L :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>Q :call ToggleList("Quickfix List", 'c')<CR>


" command -bang -nargs=? QFix    call QFixToggle(<bang>0)

function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

