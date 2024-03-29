" {{{ Lib
"
" {{{ vundle
  Plugin 'gmarik/vundle'
" }}}

" {{{ L9 (as DEP)
  Plugin 'L9'
" }}}


" {{{ calutil (as DEP)
  Plugin 'cskeeters/vim-calutil'
" }}}

" }}}

" {{{ ColorScheme

" {{{ github-like color scheme
  Plugin 'github-theme'
" }}}

" {{{ vim-molokai
  Plugin 'tomasr/molokai'
" }}}

" {{{ vim-dracula
  Plugin 'crusoexia/vim-dracula'
" }}}

" {{{ vim-colorschemes
  Plugin 'flazz/vim-colorschemes'
" }}}

" {{{ google
  Plugin 'google/vim-colorscheme-primary'
" }}}

" {{{ vim-kalisi
  Plugin 'freeo/vim-kalisi'
" }}}

" {{{ Color-Scheme-Exploer
" Plugin 'Color-Scheme-Explorer'
" }}}

" }}}

" {{{ Text Object Plugin

" {{{ argtextobj (text object of arguments)
  Plugin 'argtextobj.vim'
" }}}

" {{{ vim-textobj-user AS-DEP(vim-textobj-indent)
  Plugin 'kana/vim-textobj-user'
" }}}

" {{{ vim-textobj-indent
  Plugin 'kana/vim-textobj-indent'
" }}}

" {{{ vim-textobj-clang
" Plugin 'rhysd/vim-textobj-clang'
" let g:textobj_clang_mapping_kinds = [
"       \ 'class', 'function', 'expression',
"       \ 'statement', 'parameter', 'namespace',
"       \ 'under_cursor', 'most_inner']
" let g:textobj_clang_more_mapping   = 1
" let g:textobj_clang_more_mappings  = 1
" }}}

" {{{ libclang-vim (AS DEP) (for vim-textobj-clang)
" Plugin 'rhysd/libclang-vim'
" }}}

" }}}

" {{{ Filetype Plugin

" {{{ coffee-script
  Plugin 'kchmck/vim-coffee-script'
" }}}

" {{{ squirrel  squirrel ft plugin
  Plugin 'xevz/vim-squirrel'
" }}}

" {{{
  Plugin 'tpope/vim-markdown'
" }}}

" {{{ lua.vim
" Plugin 'vim-misc' " DEP
" Plugin 'lua.vim'
" }}}

" {{{ gtk-mode   stuffs writing gtk code(vala highlighting)
" Plugin 'gtk-mode'
" }}}

" {{{ cpp-vim (c++11 highlighting)
  Plugin 'vim-jp/cpp-vim'
" }}}

" {{{ vim-toml TOML
" Plugin 'cespare/vim-toml'
" }}}

" }}}

" {{{ Tools

" {{{ vim-fugitive
" Plugin 'tpope/vim-fugitive'
" }}}

" {{{ hsitz/VimOrganizer
  Plugin 'hsitz/VimOrganizer'

  let g:global_column_view = 1
  au BufEnter,BufRead *.org,todo,TODO set ft=org
" }}}

" {{{ NrrwRgn (DEP for VimOrganizer)
" Plugin 'chrisbra/NrrwRgn'
" }}}

" {{{ Quick Run
  Plugin 'thinca/vim-quickrun'
" }}}

" {{{ Vim-Multiple-Cursors
"  Plugin 'terryma/vim-multiple-cursors'
" }}}

" {{{ indentLine
"  Plugin 'Yggdroot/indentLine'
"  let g:indentLine_faster = 1
" }}}

" {{{ rainbow_parentheses.vim for scheme
" Plugin 'kien/rainbow_parentheses.vim'

" function RP_Load()
"   :RainbowParenthesesActivate
"   :RainbowParenthesesLoadRound
" endfunction

" "let g:rbpt_colorpairs = [
" "    \   ['brown',       'RoyalBlue3'],
" "    \   ['Darkblue',    'darkcyan'],
" "    \   ['darkgray',    'DarkOrchid3'],
" "    \   ['darkgreen',   'darkcyan'],
" "    \   ['darkcyan',    'RoyalBlue3'],
" "    \   ['darkred',     'firebrick3'],
" "    \   ['darkmagenta', 'DarkOrchid3'],
" "    \   ['brown',       'firebrick3'],
" "    \   ['gray',        'RoyalBlue3'],
" "    \   ['black',       'firebrick3'],
" "    \   ['darkmagenta', 'DarkOrchid3'],
" "    \   ['Darkblue',    'firebrick3'],
" "    \   ['darkgreen',   'RoyalBlue3'],
" "    \   ['darkcyan',    'darkcyan'],
" "    \   ['darkred',     'DarkOrchid3'],
" "    \   ['red',         'firebrick3'],
" "    \ ]

" augroup RP_LOAD
"   au Syntax scheme,lisp,elisp :call RP_Load()
" augroup END
" }}}

" {{{
  Plugin 'luochen1990/rainbow'
  let g:rainbow_active = 1
  let g:rainbow_conf = {
        \ 'ctermfgs': ['white'
        \             ,'gray'
        \             ,'darkmagenta'
        \             ,'green'
        \             ,'darkcyan'
        \             ,'darkblue'
        \             ,'red'
        \             ,],
        \ 'separately': {
        \   '*': 0,
        \   'scheme': {},
        \   'lisp':   {},
        \   'elisp':  {},
        \  }
        \}
" }}}

" {{{ vim-racer Rust complete
" Plugin 'ebfe/vim-racer'
" Plugin 'phildawes/racer'

  let g:racer_cmd    = "/home/ghlin/.local/lib/racer/racer"
  let $RUST_SRC_PATH = "/home/ghlin/.local/src/rust/rustc-1.0.0/src/"
" }}}

" {{{ Clang Complete
  Plugin 'Rip-Rip/clang_complete', { 'pinned' : 1 }

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
" Plugin 'mhinz/vim-startify'
" let g:startify_files_number = 10
" let g:startify_bookmarks    = [ '~/.vimrc', '~/.zshrc', '~/.config/awesome/rc.lua' ]
" }}}

" {{{ tablify   generate tables
" Plugin 'Stormherz/tablify'
" }}}

" {{{ airline   pretty status-line
  Plugin 'bling/vim-airline'
  let g:airline_mode_map = { '__' : '-', 'n'  : 'N', 'i'  : 'I',
      \ 'R'  : 'R', 'c'  : 'C', 'v'  : 'V', 'V'  : 'V',
      \ '' : 'V', 's'  : 'S', 'S'  : 'S', '' : 'S', }

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_symbols.paste      = "[PASTE]"
  let g:airline_symbols.whitespace = "[=]"
  let g:airline_symbols.branch     = "[BRANCH]"
  let g:airline_symbols.readonly   = "[RO]"
  let g:airline_symbols.linenr     = " "
  let g:airline_left_sep           = ""
  let g:airline_left_alt_sep       = ""
  let g:airline_right_sep          = ""
  let g:airline_right_alt_sep      = ""

  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  " let g:airline_right_sep = ''
  " let g:airline_right_alt_sep = ''
  " let g:airline_symbols.branch = ''
  " let g:airline_symbols.readonly = ''
  " let g:airline_symbols.linenr = ''

  let g:airline_theme = 'monochrome'

  function! BufNr()
    return '#' . bufnr('%')
  endfunction
  function! FFEnc()
    return printf('%s%s', &fenc, strlen(&ff) > 0 ? ' ' . &ff : '')
  endfunction

  " exclude `currenttag'
  let g:airline_section_x =
        \   '%{airline#util#prepend(BufNr(),0)}'
        \ . '%{airline#util#wrap(airline#parts#filetype(),0)}'

  let g:airline_section_y =
        \   '%{airline#util#prepend(FFEnc(),0)}'

  let g:airline#extensions#tagbar#enabled              = 0
  let g:airline#extensions#branch#enabled              = 1
  let g:airline#extensions#branch#displayed_head_limit = 10

  let g:airline#extensions#tabline#enabled             = 0
" }}}

" {{{ EasyAlign
  Plugin 'junegunn/vim-easy-align'
  vnoremap <silent> <Enter> :EasyAlign<Enter>
" }}}

" {{{ tagbar
  Plugin 'majutsushi/tagbar'
  let g:tagbar_width     = 20
  nmap  <leader>T :TagbarToggle<CR>
  nmap  <leader>p :TagbarTogglePause<CR>
" }}}

" {{{ nerdcommenter
  Plugin 'scrooloose/nerdcommenter'
" }}}

" {{{ nerdtree
  Plugin 'scrooloose/nerdtree'
  nmap  <leader>E :NERDTreeToggle<CR>
  let g:NERDTreeDirArrows=0
  let g:NERDTreeWinSize  = 18
  let g:NERDTreeSortOrder = [
                  \   '\/$'
                  \ , '\.lst$', '\.txt$', '\.vim$'
                  \ , '\.md$'
                  \ , '\.h$', '\.hpp$', '\.c$', '\.cxx$'
                  \ , '\.lua$'
                  \ , '\.run$'
                  \ , '*', '\.swp$', '\~$' ]

  hi link NERDTreePart Normal
  hi link NERDTreePartFile Normal
" }}}

" {{{ surround
  Plugin 'tpope/vim-surround'
" }}}

" {{{ VimShell   terminal inside GVim
" Plugin 'Shougo/vimproc.vim' " DEP
" Plugin 'Shougo/vimshell.vim'
" }}}

" {{{ emmet  ZenCoding
  Plugin 'mattn/emmet-vim'

  let g:user_emmet_leader_key     = '<c-e>'
  let g:user_emmet_expandword_key = '<c-e>'
  let g:user_emmit_expandabbr_key = '<c-e>'

  let g:use_emmet_complete_tag    = 1
" }}}

" {{{ VimIm   Chinese input method
" Plugin 'VimIM'
" }}}

" {{{ Gundo   visual undo-tree
  Plugin 'Gundo'

  nmap <leader>u    :GundoToggle<CR>
" }}}

" {{{ DrawIt   draw ascii pictures
" Plugin 'DrawIt'
" }}}

" {{{ UltiSnips
  Plugin 'SirVer/ultisnips', { 'pinned' : 0 }
  " use py3: clang_complete [snippets engine not found]
  if has('py3')
    let g:UltiSnipsUsePythonVersion = 2
  endif
" }}}

" {{{ cscope macros
" Plugin 'cscope_macros.vim'
" }}}

" {{{ swap-parameters   swap two parameters
  Plugin 'swap-parameters'
" }}}

" {{{ A.vim (switch between .c/.h)
  Plugin 'a.vim'
" }}}

" {{{ Easy Grep
  Plugin 'EasyGrep'
" }}}

" {{{ VisIncr (vertical inc-some)
  Plugin 'VisIncr'
" }}}

" {{{ ReplaceWithRegister
  Plugin 'ReplaceWithRegister'
" }}}

" {{{ matchit  match anywhat
  Plugin 'matchit.zip'
" }}}

" {{{ CtrlP
  Plugin 'kien/ctrlp.vim'
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

" {{{
"  Plugin 'ryanoasis/vim-devicons'
" }}}

" }}}



