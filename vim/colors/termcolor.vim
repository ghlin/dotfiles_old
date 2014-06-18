hi clear

set background=dark
let colors_name = "termcolor"

hi  DiffAdd                                ctermbg=LightBlue
hi  DiffChange                             ctermbg=LightMagenta
hi  DiffDelete                             ctermfg=Blue               ctermbg=LightCyan
hi  DiffText                                                          ctermbg=Red
hi  Directory                              ctermfg=DarkBlue
hi  ErrorMsg                               ctermfg=White              ctermbg=DarkRed
hi  FoldColumn                             ctermfg=DarkBlue           ctermbg=Gray
hi  Folded                                 ctermfg=DarkBlue           ctermbg=Gray
hi  IncSearch        cterm=reverse
hi  MatchParen                             ctermfg=White              ctermbg=DarkRed
hi  ModeMsg          cterm=bold
hi  MoreMsg                                ctermfg=DarkGreen
hi  NonText                                ctermfg=Blue
hi  Pmenu                                                             ctermbg=DarkBlue
hi  PmenuSel                               ctermfg=White              ctermbg=DarkBlue
hi  Question                               ctermfg=DarkGreen
hi  Search                                 ctermfg=none               ctermbg=DarkGreen
hi  SpecialKey                             ctermfg=DarkBlue
hi  Title                                  ctermfg=DarkMagenta
hi  TabLineFill                            ctermfg=Black              ctermbg=none
hi  VertSplit        cterm=reverse
hi  Visual           cterm=reverse                                    ctermbg=none
hi  VisualNOS        cterm=underline,bold
hi  WarningMsg                             ctermfg=DarkRed
hi  WildMenu                               ctermfg=Black              ctermbg=Yellow

hi  Comment          cterm=none            ctermfg=DarkRed
hi  Constant         cterm=none            ctermfg=Red
hi  Identifier       cterm=none            ctermfg=DarkBlue
hi  PreProc          cterm=none            ctermfg=DarkGreen
hi  Special          cterm=none            ctermfg=LightRed
hi  Statement        cterm=bold            ctermfg=Blue
hi  Type             cterm=none            ctermfg=Blue

"just patch here
hi clear LineNr
hi clear CursorLineNr
hi clear CursorLine
hi clear Comment
hi clear ColorColumn

hi! CursorLineNr     cterm=bold            ctermfg=Blue
hi! LineNr           cterm=none            ctermfg=White
hi! CursorLine       cterm=none
hi! Comment                                ctermfg=DarkGreen
hi! ColorColumn                                                      ctermbg=Gray
hi! VertSplit                              ctermfg=Black             ctermbg=Blue
hi! Todo                                                             ctermbg=DarkRed

hi! StatusLine                             ctermfg=Black             ctermbg=Red
hi! StatusLineNC                           ctermfg=Black             ctermbg=Blue

" vim: sw=2

