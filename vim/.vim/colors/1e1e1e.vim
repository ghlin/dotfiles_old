hi clear

set nocul

set background=dark

let colors_name = "1e1e1e"

"  Black    Red    Green  Yellow   Blue   Magenta  Cyan    Gray
" #000000 #B11400 #029004 #DBD600 #0040ED #8D00A4 #007E80 #D4D4D4
" #5E5E5E #EF2929 #00D30D #FCE94F #0077FF #B75FAD #34E2E2 #FFFFFF

if has("gui_running")
  hi Normal           gui=none            guifg=#FFFFFF           guibg=#1E1E1E
  hi Comment          gui=none            guifg=#029004
  hi Constant         gui=none            guifg=#5E5E5E
  hi DiffAdd                                                      guibg=#0040ED
  hi DiffChange                                                   guibg=#8D00A4
  hi DiffDelete                           guifg=#0077FF           guibg=#34E2E2
  hi DiffText                                                     guibg=#EF2929
  hi Directory                            guifg=#0040ED
  hi ErrorMsg                             guifg=#FFFFFF           guibg=#B11400
  hi FoldColumn                           guifg=#0040ED           guibg=bg
  hi Folded                               guifg=#5E5E5E           guibg=bg
  hi Identifier       gui=none            guifg=#0040ED
  hi IncSearch        gui=reverse
  hi MatchParen       gui=none            guifg=#0040ED           guibg=bg
  hi ModeMsg          gui=bold
  hi MoreMsg          gui=bold            guifg=#029004
  hi NonText                              guifg=#FFFFFF
  hi Operator                             guifg=fg
  hi Pmenu                                                        guibg=#0040ED
  hi PmenuSel                             guifg=#FFFFFF           guibg=#5E5E5E
  hi PreProc          gui=none            guifg=#029004
  hi Question                             guifg=#029004
  hi Search                               guifg=#FFFFFF           guibg=#EF2929
  hi Special          gui=none            guifg=#0040ED
  hi SpecialKey                           guifg=#0040ED
  hi Statement        gui=bold            guifg=#0077FF
  hi TabLine          gui=none                                    guibg=bg
  hi TabLineFill      gui=none
  hi TabLineSel       gui=bold            guifg=#FFFFFF           guibg=#5E5E5E
  hi Title                                guifg=#0040ED
  hi Todo             gui=underline,bold  guifg=#EF2929           guibg=bg
  hi Type             gui=bold            guifg=#0077FF
  hi VertSplit        gui=none            guifg=#0077FF           guibg=bg
  hi Visual           gui=reverse                                 guibg=bg
  hi VisualNOS        gui=underline,bold
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
  hi! CursorLineNr     gui=bold           guifg=fg
  hi! LineNr           gui=none           guifg=#5E5E5E
  hi! StatusLine                          guifg=#FFFFFF           guibg=#0077FF
  hi! StatusLineNC                        guifg=#000000           guibg=#5E5E5E

  hi link cInclude          PreProc
  hi link cPreProc          PreProc
  hi link cDefine           PreProc
  hi link cPreCondit        PreProc
else
  hi  Comment          cterm=none                                ctermfg=DarkGreen
  hi  Constant         cterm=none                                ctermfg=DarkGray
  hi  DiffAdd                                                                               ctermbg=LightBlue
  hi  DiffChange                                                                            ctermbg=LightMagenta
  hi  DiffDelete                                                 ctermfg=Blue               ctermbg=LightCyan
  hi  DiffText                                                                              ctermbg=Red
  hi  Directory                                                  ctermfg=DarkBlue
  hi  ErrorMsg                                                   ctermfg=White              ctermbg=DarkRed
  hi  FoldColumn                                                 ctermfg=DarkBlue           ctermbg=Gray
  hi  Folded                                                     ctermfg=DarkGray           ctermbg=none
  hi  Identifier       cterm=none                                ctermfg=DarkBlue
  hi  IncSearch        cterm=reverse         term=reverse
  hi  MatchParen       cterm=none                                ctermfg=DarkBlue           ctermbg=none
  hi  ModeMsg          cterm=bold            term=reverse
  hi  MoreMsg                                                    ctermfg=DarkGreen
  hi  NonText                                                    ctermfg=White
  hi  Pmenu                                                                                 ctermbg=DarkBlue
  hi  PmenuSel                                                   ctermfg=White              ctermbg=DarkBlue
  hi  PreProc          cterm=none                                ctermfg=DarkGreen
  hi  Question                                                   ctermfg=DarkGreen
  hi  Search                                                     ctermfg=White              ctermbg=Red
  hi  Special          cterm=none                                ctermfg=DarkBlue
  hi  SpecialKey                                                 ctermfg=DarkBlue
  hi  Statement        cterm=bold            term=bold           ctermfg=Blue
  hi  TabLine          cterm=none                                                           ctermbg=none
  hi  TabLineFill      cterm=none
  hi  TabLineSel       cterm=bold            term=bold           ctermfg=White              ctermbg=DarkGray
  hi  Title                                                      ctermfg=DarkBlue
  hi  Todo             cterm=underline,bold  term=underline,bold ctermfg=Red                ctermbg=none
  hi  Type             cterm=none                                ctermfg=Blue
  hi  Visual           cterm=reverse         term=reverse                                   ctermbg=none
  hi  VisualNOS        cterm=underline,bold  term=underline,bold
  hi  WarningMsg                                                 ctermfg=DarkRed
  hi  WildMenu                                                   ctermfg=White              ctermbg=Red

  "just patch here
  hi clear CursorLineNr
  hi clear CursorLine
  hi clear ColorColumn
  hi clear LineNr
  hi clear StatusLine
  hi clear StatusLineNC
  hi clear VertSplit

  hi! ColorColumn                                                                          ctermbg=Gray
  hi! CursorLine       cterm=none
  hi! CursorLineNr     cterm=bold            term=bold           ctermfg=Blue
  hi! LineNr           cterm=none                                ctermfg=DarkGray
  hi! StatusLine                                                 ctermfg=White             ctermbg=Blue
  hi! StatusLineNC                                               ctermfg=Black             ctermbg=Gray
  hi! VertSplit                                                  ctermfg=DarkGray
endif

