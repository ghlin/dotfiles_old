
let g:AM_config = {
      \ 'libpath' : [ '.', '/home/$USER/lib', '/home/$USER/.local/lib' ],
      \ 'incpath' : [ '.', '/home/$USER/include', '/home/$USER/.local/include' ],
      \ 'libs'    : [ 'pthread', 'dl' ],
      \ 'gflags'  : [ '-Wall', '-Wextra', '-g', '-fextended-identifiers' ],
      \ 'cflags'  : [ '-std=gnu99' ],
      \ 'cxxflags': [ '-std=gnu++14' ],
      \ 'ccompiler'   : 'clang',
      \ 'cxxcompiler' : 'clang++',
      \ 'exec_ext'    : 'run'
      \ }

let g:AM_enabled = 1

fu! AM_init()
  let need_init = !exists('b:AM_init_done')

  if need_init
    let b:AM_config = deepcopy(g:AM_config)
    let b:AM_enabled = 1
    let b:AM_user_makeprg = 'make'
    let b:AM_use_user_makeprg = 0

    cal AM_update_makeprg()

    let b:AM_init_done = 1

    return 1
  en

  return 0
endfu

fu! AM_check_filetype()
  if &ft == 'c'
    let b:AM_config.compiler = b:AM_config.ccompiler
    let b:AM_config.flags = b:AM_config.cflags
  elseif &ft == 'cpp'
    let b:AM_config.compiler = b:AM_config.cxxcompiler
    let b:AM_config.flags = b:AM_config.cxxflags
  en
endfu

fu! AM_enter_buffer()
  if AM_init()
    return
  en

  if !g:AM_enabled | !b:AM_enabled
    " disabled
  elseif b:AM_use_user_makeprg
    exec 'setlocal makeprg =' . b:AM_user_makeprg
  else
    cal AM_update_makeprg()
  en

  cal AM_after()
endfu

fu! AM_after()
endfu

fu! AM_build_makeprg()
  cal AM_check_filetype()

  let l:makeprg = b:AM_config.compiler . '\ ' . expand('%') . '\ -o\ '
        \ . expand('%:p:r') . '.' . b:AM_config.exec_ext

  let l:arg = [
        \ [ 'libpath', '\ -L' ],
        \ [ 'incpath', '\ -I' ],
        \ [ 'libs',    '\ -l' ],
        \ [ 'flags',   '\ ' ],
        \ [ 'gflags',  '\ ' ]
        \ ]

  for i in l:arg
    for x in b:AM_config[i[0]]
      let l:makeprg = l:makeprg . i[1] . x
    endfor
  endfor

  let b:AM_makeprg = l:makeprg
endfu

fu! AM_update_makeprg()
  cal AM_build_makeprg()
  exec 'setlocal makeprg =' . b:AM_makeprg
endfu

autocmd! BufEnter,BufRead *.c,*.cc,*.cpp,*.c++,*.cxx cal AM_enter_buffer()

fu! AM_add_flag(flag)
  cal insert(b:AM_config.gflags, a:flag)
  cal AM_update_makeprg()
endfu

fu! AM_add_libpath(path)
  cal insert(b:AM_config.libpath, a:path)
  cal AM_update_makeprg()
endfu

fu! AM_add_incpath(path)
  cal insert(b:AM_config.incpath, a:path)
  cal AM_update_makeprg()
endfu

fu! AM_add_lib(lib)
  cal insert(b:AM_config.libs, a:lib)
  cal AM_update_makeprg()
endfu

fu! AM_toggle_for_buffer()
  let b:AM_enabled = !b:AM_enabled
endfu

fu! AM_toggle_global()
  let g:AM_enabled = !g:AM_enabled
endfu

com! -nargs=1 -complete=dir              AMInc      cal AM_add_incpath('<args>')
com! -nargs=1 -complete=dir              AMLib      cal AM_add_libpath('<args>')
com! -nargs=0                            AMToggleB  cal AM_toggle_for_buffer()
com! -nargs=0                            AMToggleG  cal AM_toggle_global()

com! -nargs=1 -complete=customlist,AM_complete_cflag
      \ AMFlag     cal AM_add_flag('<args>')
com! -nargs=1 -complete=customlist,AM_complete_libs
      \ AMUse      cal AM_add_lib('<args>')

" TODO
fu! AM_complete_cflag(A, L, C)
  return [ '-rdynamic', '-shared', '-c' ]
endfu

fu! AM_complete_libs(A, L, C)
  return [ 'boost_system', 'boost_context', 'lua' ]
endfu


" TODO
"
com! -nargs=* RunThis       :!%:p:r.run <args>
nmap <leader>e    :!%:p:r.run<CR>

