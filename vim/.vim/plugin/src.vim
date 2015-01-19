finish

let g:src_types = ['c', 'cpp', 'cc', 'lua', 'vim', 'python', 'markdown',
      \            'asm', 'progress', 'java', 'javascript', 'sh', 'dosbatch',
      \            'xf86conf',
      \            'vim']

let g:use_marker = ['vim', 'lua', 'python', 'sh', 'dosbatch', 'xf86conf']

function! SettingsForSourceCode()
  for um in g:use_marker
    if um == &filetype
      setlocal foldmethod=marker
    endif
  endfor
endfunction

function! SourceCodeDetect()
  for s in g:src_types
    if &filetype == s
      call SettingsForSourceCode()
      return
    endif
  endfor
endfunction

autocmd BufEnter,BufRead  *     call SourceCodeDetect()

