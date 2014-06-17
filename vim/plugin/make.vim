" Auto Build Your Source Code
" !Not Support For Project(xxx.cc >= 2 && a was not include by b)
"
finish

let g:default_make_system = 'GCC'
" optional : CLANG, GCC
let g:enable_auto_make = 1

function! Mk_Init_For_Buffer()
  let need_do_init = !exists('b:makestuff_for_buffer')

  if !need_do_init
    call Mk_Update()
    return
  endif

  if has('win32')
    let b:libpath = ['/home/$USER/lib/']
    let b:incpath = ['/home/$USER/include/']
  else
    let b:libpath = ['c:/Users/$USER/lib/']
    let b:incpath = ['c:/Users/$USER/include/']
  endif

  let b:libs    = []
  let b:flags   = ['-Wall', '-Werror']
  let b:ccflags = ['-std=gnu99']
  let b:cxflags = ['-std=gnu++11']
  let b:makemethod = 'auto'

  let b:common               = ''
  let b:makestuff_for_buffer = 1

  " default makeprg
  call Mk_Init_By_Building_System(g:default_make_system)
endfunction

function! Mk_Init_By_Building_System(sys)
  if a:sys == 'GCC'
    let b:cc  = 'gcc'
    let b:cx  = 'g++'
  elseif a:sys == 'CLANG'
    let b:cc  = 'clang'
    let b:cx  = 'clang++'
  endif

  " Init for common
  call Mk_Init_Common()
endfunction

function! Mk_Updata_Cache()
  let b:common = ' %' . ' -o %:p:r.run'

  for item in b:libpath
    let b:common = b:common . ' -L"' . item . '"'
  endfor

  for item in b:incpath
    let b:common = b:common . ' -I"' . item . '"'
  endfor

  for item in b:libs
    let b:common = b:common . ' -l' . item
  endfor

  for item in b:f
    let b:common = b:common . ' ' . item
  endfor

  for item in b:flags
    let b:common = b:common . ' ' . item
  endfor
endfunction

function! Mk_Init_Common()
  call Mk_Check_Filetype()
  call Mk_Updata_Cache()

  call Mk_Update()
endfunction

function! Mk_Update()
  if b:makemethod == 'auto'
    let &makeprg = b:c . b:common
  elseif b:makemethod == 'make'
    let &makeprg = 'make'
  elseif b:makemethod == 'user'
    let &makeprg = b:makeprg
  else
    echohl ErrorMsg|echo 'Error: unknown policy:' . b:makemethod | echohl Normal
  endif
endfunction

function! Mk_CC()
  let b:c = b:cc
  let b:f = b:ccflags
endfunction

function! Mk_CX()
  let b:c = b:cx
  let b:f = b:cxflags
endfunction

function! Mk_Check_Filetype()
  if &ft == 'c'
    call Mk_CC()
  elseif &ft == 'cpp'
    call Mk_CX()
  endif
endfunction

function! Mk_Add_Libpath(path)
  let b:common = b:common . ' -L"' . a:path . '"'
  call Mk_Update()
endfunction

function! Mk_Add_Incpath(path)
  let b:common = b:common . ' -I"' . a:path . '"'
  call Mk_Update()
endfunction

function! Mk_Add_Lib(lib)
  let b:common = b:common . ' -l"' . a:lib . '"'
  call Mk_Update()
endfunction

function! Mk_Add_Flag(flag)
  let b:common = b:common . ' ' . a:flag
  call Mk_Update()
endfunction

function! Mk_Just_Use_Make_As_Makeprg()
  let b:makemethod = 'make'
  let &makeprg = 'make'
endfunction

function! Mk_Use_Me()
  let b:makemethod = 'auto'
  call Mk_Update()
endfunction

function! Mk_User_Define(makeprg)
  let b:makemethod = 'user'
  let b:makeprg    = a:makeprg
  call Mk_Update()
endfunction

command! -nargs=0 MkWtf     echo &makeprg
command! -nargs=0 MkMeka    call Mk_Init_For_Buffer()
command! -nargs=0 MkMake    call Mk_Just_Use_Make_As_Makeprg()
command! -nargs=1 MkUser    call Mk_User_Define('<args>')
command! -nargs=1 MkLib     call Mk_Add_Lib('<args>')
command! -nargs=1 MkIncpath call Mk_Add_Incpath('<args>')
command! -nargs=0 MkIncThis call Mk_Add_Incpath('%:h")
command! -nargs=1 MkLibpath call Mk_Add_Libpath('<args>')
command! -nargs=1 MkFlag    call Mk_Add_Flag('<args>')
command! -nargs=0 MkRebuild call Mk_Init_For_Buffer()
command! -nargs=0 MkGcc     call Mk_Init_By_Building_System('GCC')
command! -nargs=0 MkClang   call Mk_Init_By_Building_System('CLANG')

function! Mk_Autoload()
  if exists('b:makeprg')
    let &makeprg = b:makeprg_save
  endif

  if g:enable_auto_make && (&filetype == 'c' || &filetype == 'cpp')
    call Mk_Init_For_Buffer()
  endif
endfunction

function! Mk_Save()
  let b:makeprg_save = &makeprg
endfunction

autocmd! BufEnter,BufRead *                         call Mk_Autoload()
autocmd! BufLeave *                                 call Mk_Save()

nmap <leader>e    :!%:p:r.run<CR>

