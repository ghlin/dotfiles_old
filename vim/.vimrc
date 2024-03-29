" 2012.2.9.ghl@gmail.com
"
"        /-\       ,-\
"       |   \     /   |
"       |    \   /    /
"       |     >-/    /
"        \         /`
"         >-- /\ -<
"        (   /  \  )
"         |/     \/
"         /
"
"
"　　　　　　　　　　　　反　魂　蝶　で　あ　る　！

function! LoadPlugins() "{{{
  " required by Vundle
  set nocp
  filetype off
  set rtp +=~/.vim/bundle/vundle

  call vundle#begin()
  source ~/.vimrc.bundlelist
  call vundle#end()

  filetype plugin indent on
endfunction "}}}

function! PreSettings() "{{{
  let g:mapleader = ','
endfunction "}}}

function! BasicSettings() "{{{
  set nocp

  syntax on
  filetype plugin indent on

  set autoindent
  set smartindent
  set cino        =N-s,:0,b1,g0,t0,(s,Ws,l1
  set iskeyword   +=_,?
  set expandtab
  set shiftwidth  =2
  set softtabstop =2
  set tabstop     =2
  set whichwrap  +=<,>,h,l
  set list
  set conceallevel=2
  set listchars=tab:\ \ ,trail:-

  set backspace   =2
  set hidden

  " buffer operation
  nmap  <leader><  :bp<CR>
  nmap  <leader>>  :bn<CR>

  set ruler
  set showcmd
  set wildmenu
  set laststatus =0
  set cmdheight  =1
  set report     =0
  set novisualbell
  set noerrorbells

  set hlsearch
  set incsearch
  set smartcase
  set ignorecase
  set showmatch
  set matchtime  =4

  set timeoutlen =600

  nnoremap \\ :nohl<CR>

  command! -bang -nargs=? Q :echo "手抖你麻痹啊"

  " path
  set path^=~/include,~/.local/include,.,.. " this makes completion slow

  " formats
  set fileformat   =unix
  set fileformats  =unix,dos
  set fileencoding =utf-8
  set encoding     =utf-8

  if has('win32')
    set ssl  " Use `/' as dir spearator
    language C
  endif

  if has('spell')
    set spelllang    =en_us
  endif

  " z-z to leave insert mode
  inoremap zz <ESC>

  " toggle fold
  nnoremap <space>      @=((foldclosed(line('.')) < 0)?'zc':'zo')<CR>

  " remember more history commands
  set history=1000

  " toggle spell
  function! ToggleSpell()
    if !has("spell")
      echo "require spell"
      return
    endif

    let &spell = !&spell
    if &spell == 1
      echo "enable Spell Checking"
    else
      echo "disable Spell Checking"
    endif
  endfunction
  nnoremap <leader>s    :call ToggleSpell()<CR>

  " toggle show tabline
  function! ToggleTab()
    let &stal = !&stal
    if &stal == 1
      echo "show Tabline"
    else
      echo "hide Tabline"
    endif
  endfunction

  nnoremap <leader>l    :call ToggleTab()<CR>

  " hide Visual mode
  nmap    <S-q>       <leader>Q

  let g:margin_trick = 0

  if g:margin_trick
    set cc=81,101
    let i = 81


    set cc=81
    while i != 200
      let &cc = &cc . ',' . i
      let i   = i + 1
    endwhile
  endif

  set rnu
  set nu
  set so         =4
  set nowrap
  " set fdc=1
  set foldmethod =marker
  set foldlevel  =3

  autocmd! BufEnter,BufRead *.md   setlocal ft=markdown

  set errorformat^=%-GIn\ file\ included\ from\ %.%#
  let g:c_gnu = 1

  set completeopt=menu,longest

  "set wildmode=list:full
  set wildignore=*.o,*.~,*.swp,*.pyc,*.luac,*.so

  set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

  " XXX
  com! -nargs=0 LCD           :lcd       %:h
  com! -nargs=0 CD            :cd        %:h

  " perform cpp
  com! -nargs=0 PreProc       :!g++ % -o %:p:r.i -E -std=gnu++14 -I"/home/$USER/include" -DDEBUG=1

  " delete this file
  com! -nargs=0 RmThis        :!rm       % -v

  " ls
  com! -nargs=0 LS            :!ls       %:h

  " ls -al
  com! -nargs=0 LL            :!ls -al   %:h

  " when forget use `sudo'
  com! -nargs=0 ForceSave     :w !sudo tee % &>/dev/null

  function! SDCVFromInput()
    let @z = input('sdcv >>> ')
    redir =>dict
    silent exec '!sdcv --non-interactive ' . @z
    redir END
    echo dict
  endfunction

  com! -nargs=0 SDCV          :call SDCVFromInput()

  if has('gui_running')
    set keywordprg         =sdcv\ --non-interactive
  else
    set keywordprg         =sdcv
  endif

  " <C-R>=ExecPipe('colo') ==> solarized
  function! ExecPipe(cmd)
    redir =>output
    silent exec a:cmd
    redir END

    return output
  endfunction

  function! ExecPipe_Put(cmd)
    redir =>output
    silent exec a:cmd
    redir END

    put=output
  endfunction

  command! -bang -nargs=? ExecPipe :call ExecPipe_Put('<args>')

  " enable doxygen highlighting
  let g:load_doxygen_syntax = 1
endfunction "}}}

function! GuiSettings() "{{{
  set guicursor   =n-v-c:block-Cursor/lCursor
  set guicursor  ^=ve:ver5-Cursor
  set guicursor  ^=o:hor5-Cursor/lCursor
  set guicursor  ^=i-ci:ver1-Cursor/lCursor
  set guicursor  ^=r-cr:hor1-Cursor/lCursor
  set guicursor  ^=sm:block-Cursor-blinkwait75-blinkoff55-blinkon55

  if $DESKTOP_SESSION == "kde-plasma"
    " no-runtime icon when in kde-plasma DE
    set guioptions    =cf
  else
    set guioptions    =cfi
  endif

  "set guifont     =envypn
  "set guifont     =Tamsyn\ 10
  "set guifont     =Courier\ New\ 10
  "set guifont     =Ubuntu\ Mono\ 11
  "set guifont     =Fixedsys\ Excelsior\ 3.01-L2\ 11
  "set guifont     =clean\ 8
  "set guifont     =Lucida\ Console\ 12
   set guifont     =Fantasque\ Sans\ Mono\ 12
  "set guifont     =CamingoCode\ 11


  let &gfw        =&guifont

  set  cul
  colo numix
  set mouse       =

  winsize 80 25
endfunction "}}}

function! TermSettings() "{{{
  if $TERM == "xterm"
    set t_Co=256
    colorscheme      numixnb
    " hot fix
    hi!  TabLine      ctermfg=white ctermbg=234 cterm=none term=none
    hi!  TabLineFill  ctermfg=white ctermbg=234 cterm=none term=none
    " hi!  clear  CursorLine
  else
    set t_Co=8
    colorscheme      numixnb
  endif

  let g:airline_theme = 'raven'
  set title
  set termencoding=utf-8
endfunction "}}}

"{{{ apply the settings

call PreSettings()
call LoadPlugins()

call BasicSettings()

if has('gui_running')
  call GuiSettings()
else
  call TermSettings()
endif

"}}}

" vim:foldmethod=marker

