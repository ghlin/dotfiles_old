hi clear

set nocul

set background=dark
let colors_name = "console"

hi! clear Statement

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
hi!  TabLineSel       term=none cterm=none            ctermfg=White              ctermbg=DarkGray
hi!  TabLine          term=none cterm=none            ctermfg=white              ctermbg=Black
hi!  TabLineFill      term=none cterm=none            ctermfg=white              ctermbg=Black
hi!  Title            term=none cterm=none            ctermfg=DarkBlue
hi!  Todo             term=none cterm=underline,bold  ctermfg=Red                ctermbg=none
hi!  Type             term=none cterm=none            ctermfg=Blue
hi!  Visual           term=none cterm=reverse                                    ctermbg=none
hi!  VisualNOS        term=none cterm=underline
hi!  WarningMsg                                       ctermfg=DarkRed
hi!  WildMenu                                         ctermfg=White              ctermbg=Red

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
hi! CursorLineNr     cterm=bold            ctermfg=DarkBlue
hi! LineNr           cterm=none            ctermfg=Gray
hi! StatusLine                             ctermfg=White             ctermbg=Blue
hi! StatusLineNC                           ctermfg=Black             ctermbg=Gray
hi! VertSplit                              ctermfg=DarkGray


