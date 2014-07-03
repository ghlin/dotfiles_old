hi clear

set cul

set background=dark

let colors_name = "termcolor"

hi  Comment          cterm=none            ctermfg=DarkGray
hi  Constant         cterm=none            ctermfg=DarkGray
hi  DiffAdd                                ctermbg=LightBlue
hi  DiffChange                             ctermbg=LightMagenta
hi  DiffDelete                             ctermfg=Blue               ctermbg=LightCyan
hi  DiffText                                                          ctermbg=Red
hi  Directory                              ctermfg=DarkBlue
hi  ErrorMsg                               ctermfg=White              ctermbg=DarkRed
hi  FoldColumn                             ctermfg=DarkBlue           ctermbg=Gray
hi  Folded                                 ctermfg=Black              ctermbg=DarkGray
hi  Identifier       cterm=none            ctermfg=DarkBlue
hi  IncSearch        cterm=reverse
hi  MatchParen       cterm=underline       ctermfg=DarkBlue           ctermbg=none
hi  ModeMsg          cterm=bold
hi  MoreMsg                                ctermfg=DarkGreen
hi  NonText                                ctermfg=White
hi  Pmenu                                                             ctermbg=DarkBlue
hi  PmenuSel                               ctermfg=White              ctermbg=DarkBlue
hi  PreProc          cterm=none            ctermfg=DarkGreen
hi  Question                               ctermfg=DarkGreen
hi  Search                                 ctermfg=White              ctermbg=Red
hi  Special          cterm=none            ctermfg=LightRed
hi  SpecialKey                             ctermfg=DarkBlue
hi  Statement        cterm=bold            ctermfg=Blue
hi  TabLine          cterm=none                                       ctermbg=none
hi  TabLineFill      cterm=none
hi  TabLineSel       cterm=bold            ctermfg=White              ctermbg=DarkGray
hi  Title                                  ctermfg=DarkMagenta
hi  Todo             cterm=bold            ctermfg=Red
hi  Type             cterm=none            ctermfg=Blue
hi  Visual           cterm=reverse                                    ctermbg=none
hi  VisualNOS        cterm=underline,bold
hi  WarningMsg                             ctermfg=DarkRed
hi  WildMenu                               ctermfg=White              ctermbg=Red

"just patch here
hi clear CursorLineNr
hi clear CursorLine
hi clear ColorColumn
hi clear LineNr
hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit

hi! ColorColumn                                                      ctermbg=Gray
hi! CursorLine       cterm=none
hi! CursorLineNr     cterm=bold            ctermfg=White
hi! LineNr           cterm=none            ctermfg=DarkGray
hi! StatusLine                             ctermfg=White             ctermbg=Blue
hi! StatusLineNC                           ctermfg=Black             ctermbg=Gray
hi! VertSplit                              ctermfg=DarkGray

" vim: sw=2

