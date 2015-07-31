hi clear

set nocul

set background=dark

let colors_name = "numixnb"

"  Black    Red    Green  Yellow   Blue   Magenta  Cyan    Gray
" #000000 #B11400 #029004 #DBD600 #0040ED #8D00A4 #007E80 #D4D4D4
" #5E5E5E #EF2929 #00D30D #FCE94F #0077FF #B75FAD #34E2E2 #FFFFFF

if has("gui_running")
  hi Normal           gui=none            guifg=#FFFFFF           guibg=#2D2D2D
  hi Comment          gui=none            guifg=#029004
  hi Constant         gui=none            guifg=#5E5E5E
  hi DiffAdd                                                      guibg=#0040ED
  hi DiffChange                                                   guibg=#8D00A4
  hi DiffDelete                           guifg=#0077FF           guibg=#34E2E2
  hi DiffText                                                     guibg=#EF2929
  hi Directory                            guifg=#0040ED
  hi ErrorMsg                             guifg=#FFFFFF           guibg=#B11400
  hi FoldColumn                           guifg=#0040ED           guibg=#D4D4D4
  hi Folded                               guifg=#5E5E5E           guibg=bg
  hi Identifier       gui=none            guifg=#0040ED
  hi IncSearch        gui=reverse
  hi MatchParen       gui=none            guifg=#0040ED           guibg=bg
  hi ModeMsg          gui=none
  hi MoreMsg          gui=none            guifg=#029004
  hi NonText                              guifg=#FFFFFF
  hi Operator                             guifg=fg
  hi Pmenu                                                        guibg=#0040ED
  hi PmenuSel                             guifg=#FFFFFF           guibg=#5E5E5E
  hi PreProc          gui=none            guifg=#029004
  hi Question                             guifg=#029004
  hi Search                               guifg=#FFFFFF           guibg=#EF2929
  hi Special          gui=none            guifg=#0040ED
  hi SpecialKey                           guifg=#0040ED
  hi Statement        gui=none            guifg=#0077FF
  hi TabLine          gui=none                                    guibg=bg
  hi TabLineFill      gui=none
  hi TabLineSel       gui=none            guifg=#FFFFFF           guibg=#5E5E5E
  hi Title                                guifg=#0040ED
  hi Todo             gui=underline       guifg=#EF2929           guibg=bg
  hi Type             gui=none            guifg=#0077FF
  hi VertSplit        gui=none            guifg=#0077FF           guibg=bg
  hi Visual           gui=reverse                                 guibg=bg
  hi VisualNOS        gui=underline
  hi WarningMsg                           guifg=#B11400
  hi WildMenu                             guifg=#FFFFFF           guibg=#EF2929

  "just patch here
  hi clear CursorLineNr
  hi clear CursorLine
  hi clear ColorColumn
  hi clear LineNr
  hi clear StatusLine
  hi clear StatusLineNC

  hi! ColorColumn                                                 guibg=#D4D4D4
  hi! CursorLine       gui=none
  hi! CursorLineNr     gui=none           guifg=#FFFFFF
  hi! LineNr           gui=none           guifg=#5E5E5E
  hi! StatusLine                          guifg=#FFFFFF           guibg=#0077FF
  hi! StatusLineNC                        guifg=#000000           guibg=#5E5E5E

  hi link cInclude          PreProc
  hi link cPreProc          PreProc
  hi link cDefine           PreProc
  hi link cPreCondit        PreProc
else
  hi!  Comment          term=none cterm=none            ctermfg=DarkGreen
  hi!  Constant         term=none cterm=none            ctermfg=DarkGray
  hi!  DiffAdd          term=none cterm=none                                       ctermbg=LightBlue
  hi!  DiffChange       term=none cterm=none                                       ctermbg=LightMagenta
  hi!  DiffDelete       term=none cterm=none            ctermfg=Blue               ctermbg=LightCyan
  hi!  DiffText         term=none cterm=none                                       ctermbg=Red
  hi!  Directory        term=none cterm=none            ctermfg=DarkBlue
  hi!  ErrorMsg         term=none cterm=none            ctermfg=White              ctermbg=DarkRed
  hi!  FoldColumn       term=none cterm=none            ctermfg=DarkBlue           ctermbg=Gray
  hi!  Folded           term=none cterm=none            ctermfg=DarkGray           ctermbg=none
  hi!  Identifier       term=none cterm=none            ctermfg=DarkBlue
  hi!  IncSearch        term=none cterm=reverse
  hi!  MatchParen       term=none cterm=none            ctermfg=DarkBlue           ctermbg=none
  hi!  ModeMsg          term=none cterm=bold
  hi!  MoreMsg          term=none cterm=none            ctermfg=DarkGreen
  hi!  NonText          term=none cterm=none            ctermfg=White
  hi!  Pmenu            term=none cterm=none                                       ctermbg=DarkBlue
  hi!  PmenuSel         term=none cterm=none            ctermfg=White              ctermbg=DarkBlue
  hi!  PreProc          term=none cterm=none            ctermfg=DarkGreen
  hi!  Question         term=none cterm=none            ctermfg=DarkGreen
  hi!  Search           term=none cterm=none            ctermfg=White              ctermbg=Red
  hi!  Special          term=none cterm=none            ctermfg=DarkBlue
  hi!  SpecialKey       term=none cterm=none            ctermfg=DarkBlue
  hi!  Statement        term=none cterm=none            ctermfg=Blue
  hi!  TabLine          term=none cterm=none                                       ctermbg=none
  hi!  TabLineFill      term=none cterm=none
  hi!  TabLineSel       term=none cterm=none            ctermfg=White              ctermbg=DarkGray
  hi!  Title            term=none cterm=none            ctermfg=DarkBlue
  hi!  Todo             term=none cterm=underline,bold  ctermfg=Red                ctermbg=none
  hi!  Type             term=none cterm=none            ctermfg=Blue
  hi!  Visual           term=none cterm=reverse                                    ctermbg=none
  hi!  VisualNOS        term=none cterm=underline
  hi!  WarningMsg                             ctermfg=DarkRed
  hi!  WildMenu                               ctermfg=White              ctermbg=Red

  "just patch here
  hi! clear CursorLineNr
  hi! clear CursorLine
  hi! clear ColorColumn
  hi! clear LineNr
  hi! clear StatusLine
  hi! clear StatusLineNC
  hi! clear VertSplit

  hi! ColorColumn                                                      ctermbg=Gray
  hi! CursorLine       cterm=none
  hi! CursorLineNr     cterm=bold            ctermfg=White
  hi! LineNr           cterm=none            ctermfg=DarkGray
  hi! StatusLine                             ctermfg=White             ctermbg=Blue
  hi! StatusLineNC                           ctermfg=Black             ctermbg=Gray
  hi! VertSplit                              ctermfg=DarkGray
endif


