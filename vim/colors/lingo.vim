" Vim color file
" Colorscheme by ghl

hi clear
let colors_name = 'lingo'


if has('gui_running')

  set nocul

  hi Normal                               guifg=#EDEDED            guibg=#090909

  hi ColorColumn                                                   guibg=#111111
  hi Conceal                              guifg=DarkGreen          guibg=bg
  hi Cursor                               guifg=bg                 guibg=DarkGreen
  hi CursorLine   gui=none                                         guibg=#111111
  hi CursorLineNr gui=bold                guifg=White              guibg=bg
  hi DiffAdd                                                       guibg=#66FF66
  hi DiffChange                                                    guibg=#FF6666
  hi DiffDelete                                                    guibg=#6666FF
  hi DiffText                                                      guibg=#111111
  hi Directory                            guifg=Blue
  hi ErrorMsg     gui=bold                guifg=Red                guibg=bg
  hi FoldColumn                           guifg=DarkGray           guibg=bg
  hi Folded                               guifg=DarkGray           guibg=bg
  hi IncSearch    gui=reverse
  hi Label        gui=none                guifg=#0022FF
  hi LineNr                               guifg=DarkGray           guibg=#111111
  hi MatchParen   gui=underline,bold      guifg=DarkGreen          guibg=bg
  hi ModeMsg      gui=bold                guifg=DarkGreen
  hi MoreMsg      gui=bold                guifg=DarkGreen
  hi NonText                              guifg=DarkGray           guibg=#0E0E0E
  hi PMenuSbar                                                     guibg=DarkBlue
  hi PMenuThumb                                                    guibg=DarkGray
  hi Pmenu                                guifg=DarkBlue           guibg=bg
  hi PmenuSel     gui=italic              guifg=White              guibg=DarkBlue
  hi Question                             guifg=Red
  hi Search                               guifg=White              guibg=DarkBlue
  hi StatusLine                           guifg=#000F00            guibg=fg
  hi StatusLineNC                         guifg=Black              guibg=DarkGreen
  hi SpecialKey                           guifg=DarkBlue
  hi TabLine      gui=none                guifg=White              guibg=bg
  hi TabLineFill                          guifg=Black
  hi TabLineSel   gui=none                guifg=White              guibg=DarkBlue
  hi Title                                guifg=DarkGreen
  hi VertSplit                            guifg=Black              guibg=Black
  hi Visual                               guifg=White              guibg=#222222
  hi WarningMsg                           guifg=DarkGreen
  hi WildMenu                             guifg=#000F00            guibg=White

  " Patch

  " syntax highlighting
  hi Todo         gui=underline,bold  guifg=DarkRed            guibg=bg
  hi Comment      gui=none            guifg=DarkGreen
  hi Constant     gui=none            guifg=#777777
  hi Identifier   gui=none            guifg=#3333FF
  hi PreProc      gui=bold            guifg=DarkGreen
  hi Special      gui=bold            guifg=DarkGreen
  hi Statement    gui=bold            guifg=#0022ff
  hi Type         gui=bold            guifg=#3030FF
  hi Operator     gui=bold            guifg=Gray
  hi luaOperator                      guifg=Blue
else " no gui
  set background=light

  set t_Co=256
  set nocul

  let s:white         = '255'
  let s:red           = '196'
  let s:darkgreen     = '22'
  let s:darkblue      = 'Blue'
  let s:black         = '232'
  let s:i_dont_know   = '53'
  let s:darkcyan      = '67'
  let s:darkgray      = 'DarkGray'
  let s:gray          = '242'

  let s:none          = 'none'
  let s:italic        = 'italic'
  let s:bold          = 'bold'
  let s:reverse       = 'reverse'
  let s:underline     = 'underline'

  exec 'hi! ' . 'Normal'        . ' ctermfg=' . s:white       . ' ctermbg=' . s:black     . ' cterm=' . s:none

  exec 'hi! ' . 'Comment'       . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Constant'      . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'CursorLineNr'  . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:bold
  exec 'hi! ' . 'ColorColumn'   .                               ' ctermbg=' . s:darkgray  . ' cterm=' . s:none
  exec 'hi! ' . 'Directory'     . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'FoldColumn'    . ' ctermfg=' . s:darkgray    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Folded'        . ' ctermfg=' . s:darkgray    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Identifier'    . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'IncSearch'     . ' ctermfg=' . s:white       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
  exec 'hi! ' . 'Keyword'       . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:none      . ' cterm=' . s:none
  exec 'hi! ' . 'Label'         . ' ctermfg=' . s:gray        . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'LineNr'        . ' ctermfg=' . s:white       . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'MatchParen'    . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:underline
  exec 'hi! ' . 'ModeMsg'       . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:bold
  exec 'hi! ' . 'MoreMsg'       . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:bold
  exec 'hi! ' . 'NonText'       . ' ctermfg=' . s:white       . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Operator'      . ' ctermfg=' . s:gray        . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'PMenuThumb'    . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'PMenuSbar'     . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
  exec 'hi! ' . 'Pmenu'         . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'PmenuSel'      . ' ctermfg=' . s:white       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
  exec 'hi! ' . 'PreProc'       . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Question'      . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:bold
  exec 'hi! ' . 'Search'        . ' ctermfg=' . s:white       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:underline
  exec 'hi! ' . 'Special'       . ' ctermfg=' . s:darkgray    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'StatusLine'    . ' ctermfg=' . s:darkgreen   . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'TabLineSel'    . ' ctermfg=' . s:white       . ' ctermbg=' . s:gray      . ' cterm=' . s:none
  exec 'hi! ' . 'Tabline'       . ' ctermfg=' . s:white       . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'TablineFill'   . ' ctermfg=' . s:black       . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Title'         . ' ctermfg=' . s:black       . ' ctermbg=' . s:gray      . ' cterm=' . s:none
  exec 'hi! ' . 'Todo'          . ' ctermfg=' . s:red         . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'Type'          . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'VertSplit'     . ' ctermfg=' . s:white       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
  exec 'hi! ' . 'Visual'        . ' ctermfg=' . s:white       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
  exec 'hi! ' . 'WarningMsg'    . ' ctermfg=' . s:red         . ' ctermbg=' . s:black     . ' cterm=' . s:none
  exec 'hi! ' . 'WildMenu'      . ' ctermfg=' . s:white       . ' ctermbg=' . s:darkgray  . ' cterm=' . s:none

  hi! link Statement        Keyword

endif

hi link  Number         Constant
hi link  String         Constant
hi link  Boolean        Constant
hi link  Character      Constant
hi link  Float          Constant
hi link  Identifier     Type
hi link  luaFunc        Type
hi link  luaFunction    Type

hi link cInclude       PreProc
hi link cDefine        PreProc
" vim: sw=2
