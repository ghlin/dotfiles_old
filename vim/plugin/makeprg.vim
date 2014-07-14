" auto set makeprg

let g:default_compiler = 'GCC'

function! Makeprg_init()
  let need_do_init = !exists('b:makeprg_loaded')

  if need_do_init
    let b:libpath = ['.', '/home/$USER/lib']
    let b:incpath = ['/home/$USER/include']

    " freq-used
    let b:libs = ['pthread', 'lua', 'dl']
    let b:flags = ['-Wall', '-Werror', '-g']
    let b:ccflags = ['-std=gnu99']
    let b:cxflags = ['-std=gnu++11']

    let b:makeprg_enabled = 1
    let b:makeprg_loaded  = 1

    let b:compiler = g:default_compiler

    let b:makeprg_user_defined_makeprg = "make"
    let b:makeprg_user_defined         = 0

    call Makeprg_check_cc()
  endif

  call Makeprg_update()
endfunction

function! Makeprg_check_cc()
  if b:compiler == 'GCC'
    let b:cc = 'gcc'
    let b:cx = 'g++'
  elseif b:compiler == 'CLANG'
    let b:cc = 'clang'
    let b:cx = 'clang++'
  endif
endfunction

function! Makeprg_check_compiler()
  if &ft == 'c'
    let b:c = b:cc
    let b:f = b:ccflags
  elseif &ft == 'cpp'
    let b:c = b:cx
    let b:f = b:cxflags
  endif
endfunction

function! Makeprg_auto()
  let b:makeprg_user_defined = 0
  call Makeprg_init()
endfunction

function! Makeprg_user()
  let b:makeprg_user_defined = 1
  call Makeprg_init()
endfunction

function! Makeprg_user_defined(makeprg)
  let b:makeprg_user_defined_makeprg = a:makeprg
  echo "Set makeprg to: " . a:makeprg
  call Makeprg_user()
endfunction

function! Makeprg_update()
  if !b:makeprg_enabled
    return
  endif

  if b:makeprg_user_defined
    exec 'setlocal makeprg=' . b:makeprg_user_defined_makeprg
    return
  endif

  if !exists('b:makeprg_builded')
    let b:makeprg_builded = 1
    call Makeprg_build_makeprg()
  endif

  if b:makeprg_enabled
    exec 'setlocal makeprg=' . b:makeprg
  endif
endfunction

function! Makeprg_build_makeprg()
  call Makeprg_check_compiler()

  let b:common = b:c . '\ ' . expand('%') . '\ -o\ ' . expand('%:p:r') . '.run'

  for item in b:libpath
    let b:common = b:common . '\ -L' . item
  endfor

  for item in b:incpath
    let b:common = b:common . '\ -I' . item
  endfor

  for item in b:libs
    let b:common = b:common . '\ -l' . item
  endfor

  for item in b:f
    let b:common = b:common . '\ ' . item
  endfor

  for item in b:flags
    let b:common = b:common . '\ ' . item
  endfor

  let b:makeprg = b:common
endfunction

autocmd! BufEnter,BufRead *.c,*.cc,*.cpp,*.c++,*.cxx,*.inl,*.h,*.hpp call Makeprg_init()
com! -nargs=* RunThis       :!%:p:r.run <args>
nmap <leader>e    :!%:p:r.run<CR>

function! Makeprg_add_flag(flag)
  call insert(b:f, a:flag)
  call Makeprg_build_makeprg()
  call Makeprg_update()
endfunction

function! Makeprg_add_incpath(path)
  call insert(b:incpath, a:path)
  call Makeprg_build_makeprg()
  call Makeprg_update()
endfunction

function! Makeprg_add_libpath(path)
  call insert(b:libpath, a:path)
  call Makeprg_build_makeprg()
  call Makeprg_update()
endfunction

function! Makeprg_add_lib(lib)
  call insert(b:libs, a:lib)
  call Makeprg_build_makeprg()
  call Makeprg_update()
endfunction

function! Makeprg_toggle()
  let b:makeprg_enabled = !b:makeprg_enabled

  if b:makeprg_enabled
    echo "Auto Makeprg Enabled!"
  else
    echo "Auto Makeprg Disabled!"
  endif
endfunction

function! CFlag(A, L, C)
  " test command -complete=xxx
  return ['-rdynamic', '-shared', '-c']
endfunction



command! -nargs=1 -complete=dir              MkIncpath  call Makeprg_add_incpath('<args>')
command! -nargs=1 -complete=dir              MkLibpath  call Makeprg_add_libpath('<args>')
command! -nargs=1                            MkLib      call Makeprg_add_lib('<args>')
command! -nargs=0                            MkIncThis  call Makeprg_add_incpath('%:h')
command! -nargs=1 -complete=customlist,CFlag MkFlag     call Makeprg_add_flag('<args>')
command! -nargs=0                            MkToggle   call Makeprg_toggle()
command! -nargs=1                            MkCustom   call Makeprg_user_defined('<args>')
command! -nargs=0                            MkAuto     call Makeprg_auto()
command! -nargs=0                            MkUser     call Makeprg_user()

