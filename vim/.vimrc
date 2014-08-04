""
" <2012.2.9.ghl@gmail.com>
" Happy Coding...

function! LoadPlugins() "{{{
  " required by Vundle
  set nocp
  filetype off
  set rtp +=~/.vim/bundle/vundle
  call vundle#rc()


  " Search END_OF_BUNDLE_LIST to seek to the end {{{
  " {{{ vundle
    Bundle 'gmarik/vundle'
  " }}}

  " {{{ github-like color scheme
  " Bundle 'github-theme'
  " }}}

  " {{{ cpp-vim (c++11 highlighting)
    Bundle 'vim-jp/cpp-vim'
  " }}}

  " {{{ cscope macros
    Bundle 'cscope_macros.vim'
  " }}}

  " {{{ L9 (as DEP)
    Bundle 'L9'
  " }}}

  " {{{ CtrlP
    Bundle 'kien/ctrlp.vim'
    let g:ctrlp_map = '<leader>F'  " :CtrlP
    noremap <leader>R  :CtrlPMRUFiles<CR>
    noremap <leader>B  :CtrlPBuffer<CR>

    " <leader>C (c for cycle) is batter than <leader>B
    noremap <leader>C  :CtrlPBuffer<CR>

    let g:ctrlp_mruf_max = 1000

    let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git)$',
          \ 'file': '\v[\/]\.(exe|so|dll|luac|run|pyc|swp|a|o)$',
          \ 'link': '',
          \ }
  " }}}

  " {{{ Easy Grep
    Bundle 'EasyGrep'
  " }}}

  " {{{ VisIncr (vertical inc-some)
    Bundle 'VisIncr'
  " }}}

  " {{{ A.vim (switch between .c/.h)
    Bundle 'a.vim'
  " }}}

  " {{{ argtextobj (text object of arguments)
    Bundle 'argtextobj.vim'
  " }}}

  " {{{ vim-textobj-user AS-DEP(vim-textobj-indent)
    Bundle 'kana/vim-textobj-user'
  " }}}

  " {{{ vim-textobj-indent
    Bundle 'kana/vim-textobj-indent'
  " }}}

  " {{{ vim-textobj-clang
  " Bundle 'rhysd/vim-textobj-clang'
  " let g:textobj_clang_mapping_kinds = [
  "       \ 'class', 'function', 'expression',
  "       \ 'statement', 'parameter', 'namespace',
  "       \ 'under_cursor', 'most_inner']
  " let g:textobj_clang_more_mapping   = 1
  " let g:textobj_clang_more_mappings  = 1
  " }}}

  " {{{ libclang-vim (AS DEP) (for vim-textobj-clang)
  " Bundle 'rhysd/libclang-vim'
  " }}}

  " {{{ swap-parameters   swap two parameters
    Bundle 'swap-parameters'
  " }}}

  " {{{ matchit  match anywhat
    Bundle 'matchit.zip'
  " }}}

  " {{{ gtk-mode   stuffs writing gtk code(vala highlighting)
  " Bundle 'gtk-mode'
  " }}}

  " {{{ ReplaceWithRegister
    Bundle 'ReplaceWithRegister'
  " }}}

  " {{{ UltiSnips
    Bundle 'SirVer/ultisnips'
    " use py3: clang_complete [snippets engine not found]
    if has('py3')
      let g:UltiSnipsUsePythonVersion = 2
    endif
  " }}}

  " {{{ Clang Complete
    Bundle 'Rip-Rip/clang_complete'
    let g:clang_complete_auto     = 1
    let g:clang_auto_select       = 1
    let g:clang_complete_copen    = 1
    let g:clang_use_library       = 1
    let g:clang_complete_auto     = 0
    let g:clang_snippets          = 1
    let g:clang_snippets_engine   = 'ultisnips'
    let g:clang_hl_errors         = 0
    let g:clang_complete_macros   = 1
    let g:clang_complete_patterns = 1
    let g:clang_periodic_quickfix = 0
    let g:clang_close_preview     = 1

    nnoremap <leader>q       :call g:ClangUpdateQuickFix()<CR>
  " }}}

  " {{{ startify   a pretty welcome screen
  " Bundle 'mhinz/vim-startify'
  " let g:startify_files_number = 10
  " let g:startify_bookmarks    = [ '~/.vimrc', '~/.zshrc', '~/.config/awesome/rc.lua' ]
  " }}}

  " {{{ tablify   generate tables
  " Bundle 'Stormherz/tablify'
  " }}}

  " {{{ airline   pretty status-line
    Bundle 'bling/vim-airline'
    let g:airline_mode_map = { '__' : '-', 'n'  : 'N', 'i'  : 'I',
        \ 'R'  : 'R', 'c'  : 'C', 'v'  : 'V', 'V'  : 'V',
        \ '' : 'V', 's'  : 'S', 'S'  : 'S', '' : 'S', }


    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    if has('gui_running')
      let g:airline_symbols.paste      = "[paste]"
      let g:airline_symbols.whitespace = "[=]"
      let g:airline_symbols.branch     = "[branch]"
      let g:airline_symbols.readonly   = "[RO]"
      let g:airline_symbols.linenr     = "L"

      let g:airline_left_sep           = "|"
      let g:airline_left_alt_sep       = "|"
      let g:airline_right_sep          = "|"
      let g:airline_right_alt_sep      = "|"
    else
      let g:airline_symbols.paste      = "paste"
      let g:airline_symbols.whitespace = "\u2739"
      let g:airline_symbols.branch     = "\ue0a0"
      let g:airline_symbols.readonly   = "\ue0a2"
      let g:airline_symbols.linenr     = "\ue0a1"

      let g:airline_left_sep           = "\ue0b1"
      let g:airline_left_alt_sep       = "\ue0b1"
      let g:airline_right_sep          = "\ue0b3"
      let g:airline_right_alt_sep      = "\ue0b3"
    endif

    if has('gui_running')
      let g:airline_theme = 'monochrome'
    endif

    function! BufNr()
      return '#' . bufnr('%')
    endfunction

    " function! Face()
    "   if "$TERM" == "linux"
    "     return '=w='
    "   else
    "     return ''
    "   endif
    " endfunction

    " let g:airline_section_b =
    "      \   '%{airline#util#wrap(Face(),0)}'

    " let g:airline_section_x =
    "       \   '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}'
    "       \ . '%{airline#util#prepend(BufNr(),0)}'
    "       \ . '%{airline#util#wrap(airline#parts#filetype(),0)}'

    " exclude `currenttag'
    let g:airline_section_x =
          \   '%{airline#util#prepend(BufNr(),0)}'
          \ . '%{airline#util#wrap(airline#parts#filetype(),0)}'

    let g:airline_section_y =
          \   '%{airline#util#prepend(airline#parts#ffenc(),0)}'

    let g:airline#extensions#tagbar#enabled              = 0
    let g:airline#extensions#branch#enabled              = 1
    let g:airline#extensions#branch#displayed_head_limit = 10

    let g:airline#extensions#tabline#enabled             = 0

"    let g:airline#extensions#tabline#left_sep         = g:airline_left_sep
"    let g:airline#extensions#tabline#right_sep        = g:airline_right_sep
"    let g:airline#extensions#tabline#show_buffers     = 1
"    let g:airline#extensions#tabline#show_tab_nr      = 1
"    let g:airline#extensions#tabline#buffer_min_count = 1
  " }}}

  " {{{ calutil (as DEP)
    Bundle 'cskeeters/vim-calutil'
  " }}}

  " {{{ EasyAlign
    Bundle 'junegunn/vim-easy-align'
    vnoremap <silent> <Enter> :EasyAlign<Enter>
  " }}}

  " {{{ tagbar
    Bundle 'majutsushi/tagbar'
    let g:tagbar_width     = 20
    nmap  <leader>T :TagbarToggle<CR>
    nmap  <leader>p :TagbarTogglePause<CR>
  " }}}

  " {{{ nerdcommenter
    Bundle 'scrooloose/nerdcommenter'
  " }}}

  " {{{ nerdtree
    Bundle 'scrooloose/nerdtree'
    nmap  <leader>E :NERDTreeToggle<CR>
    let g:NERDTreeWinSize  = 18
    let g:NERDTreeSortOrder = [
                    \   '\/$'
                    \ , '\.lst$', '\.txt$', '\.vim$'
                    \ , '\.md$'
                    \ , '\.h$', '\.hpp$', '\.c$', '\.cxx$'
                    \ , '\.lua$'
                    \ , '\.run$'
                    \ , '*', '\.swp$', '\~$' ]
    let NERDTreeDirArrows=1
  " }}}

  " {{{ surround
    Bundle 'tpope/vim-surround'
  " }}}

  " {{{ VimProc  (as DEP)(of VimShell)
  " Bundle 'Shougo/vimproc.vim'
  " }}}

  " {{{ VimShell   terminal inside GVim
  " Bundle 'Shougo/vimshell.vim'
  " }}}

  " {{{ emmet  ZenCoding
    Bundle 'mattn/emmet-vim'

    let g:user_emmet_leader_key     = '<c-e>'
    let g:user_emmet_expandword_key = '<c-e>'
    let g:user_emmit_expandabbr_key = '<c-e>'
    let g:user_emmet_next_key       = '<c-e>j'
    let g:user_emmet_prev_key       = '<c-e>J'

    let g:use_emmet_complete_tag    = 1
  " }}}

  " {{{ VimIm   Chinese input method
  " Bundle 'VimIM'
  " }}}

  " {{{ Gundo   visual undo-tree
  " Bundle 'Gundo'
  " }}}

  " {{{ DrawIt   draw ascii pictures
  " Bundle 'DrawIt'
  " }}}

  " {{{ lua.vim
  " Bundle 'lua.vim'
  " }}}

  " {{{ vim-misc AS DEP(lua.vim)
  " Bundle 'vim-misc'
  " }}}

  " {{{ indentLine
  " Bundle 'Yggdroot/indentLine'
  " let g:indentLine_faster = 1
  " }}}

  " {{{ vim-molokai
  " Bundle 'tomasr/molokai'
  " }}}

  " {{{ rainbow_parentheses.vim for scheme
  " Bundle 'kien/rainbow_parentheses.vim'
  " au BufEnter,BufRead *.scm :RainbowParenthesesActivate
  " au BufEnter,BufRead *.scm :RainbowParenthesesLoadRound
  " }}}

  " {{{ squirrel  squirrel ft plugin
  " Bundle 'xevz/vim-squirrel'
  " }}}

  " {{{ vim-fugitive
  " Bundle 'tpope/vim-fugitive'
  " }}}

  " {{{ hsitz/VimOrganizer
  " Bundle 'hsitz/VimOrganizer'

  " let g:global_column_view = 1
  " au BufEnter,BufRead *.org,todo,TODO set ft=org
  " }}}

  " {{{ NrrwRgn (DEP for VimOrganizer)
  " Bundle 'chrisbra/NrrwRgn'
  " }}}

  " {{{ Color-Scheme-Exploer
  " Bundle 'Color-Scheme-Explorer'
  " }}}

  " MARK END_OF_BUNDLE_LIST }}}

  syntax on
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
  set laststatus =2
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
  set path^=~/include,.,.. " this makes completion slow

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
  com! -nargs=0 PreProc       :!g++ % -o %:p:r.i -E -std=gnu++11 -I"/home/$USER/include" -DDEBUG=1

  " delete this file
  com! -nargs=0 RmThis        :!rm       % -v

  " ls
  com! -nargs=0 LS            :!ls       %:h

  " ls -al
  com! -nargs=0 LL            :!ls -al   %:h

  " when forget use `sudo'
  com! -nargs=0 ForceSave     :w !sudo tee % &>/dev/null

  function! YDCVFromInput()
    let @z = input('ydcv >>> ')
    redir =>dict
    silent exec '!ydcv --color=never ' . @z
    redir END
    echo dict
  endfunction

  com! -nargs=0 YDCV          :call YDCVFromInput()

  if has('gui_running')
    set keywordprg         =ydcv\ --color=never
  else
    set keywordprg         =ydcv
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
  " let g:load_doxygen_syntax = 1
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

  com! -nargs=0 Demode :call Demode()

  set guifont     =PT\ Mono\ 11
  " set gfw         =MingLiU\ 10

  colorscheme     numix

  set mouse       =
endfunction "}}}

function! TermSettings() "{{{
  if $TERM == "xterm"
    set t_Co=256
  else
    set t_Co=8
    let &t_SI = "\<Esc>[?6;13;0;c"
    let &t_EI = "\<Esc>[?16;13;0;c"
  endif

  let g:airline_theme = 'monochrome'
  colorscheme      numix

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

" vim foldmethod:marker

