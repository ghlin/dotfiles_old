hi clear

set background=dark
let colors_name = "termcolor"

hi Normal     guifg=Black  guibg=White
hi Cursor     guifg=bg     guibg=fg
hi lCursor    guifg=NONE   guibg=Cyan

hi DiffAdd    ctermbg=LightBlue    guibg=LightBlue
hi DiffChange ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete ctermfg=Blue     ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi DiffText   ctermbg=Red     cterm=bold gui=bold guibg=Red
hi Directory  ctermfg=DarkBlue     guifg=Blue
hi ErrorMsg   ctermfg=White     ctermbg=DarkRed  guibg=Red      guifg=White
hi FoldColumn ctermfg=DarkBlue     ctermbg=Grey     guibg=Grey      guifg=DarkBlue
hi Folded     ctermbg=Grey     ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse     gui=reverse
hi MatchParen ctermfg=White  ctermbg=DarkRed
hi ModeMsg    cterm=bold     gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue     gui=bold guifg=gray guibg=white
hi Operator   guifg=fg
hi Pmenu      guibg=LightBlue ctermbg=DarkBlue
hi PmenuSel   ctermfg=White     ctermbg=DarkBlue  guifg=White  guibg=DarkBlue
hi Question   ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi Search     ctermfg=NONE     ctermbg=DarkGreen  ctermfg=Black guibg=Yellow guifg=NONE
hi SpecialKey ctermfg=DarkBlue     guifg=Blue
hi Title      ctermfg=DarkMagenta  gui=bold guifg=Magenta
hi TabLineFill ctermbg=none ctermfg=Black
hi VertSplit  cterm=reverse     gui=reverse
hi Visual     ctermbg=NONE     cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=DarkRed     guifg=Red
hi WildMenu   ctermfg=Black     ctermbg=Yellow    guibg=Yellow guifg=Black

hi Comment    cterm=NONE ctermfg=DarkRed     gui=NONE guifg=Red
hi Constant   cterm=NONE ctermfg=Red   gui=NONE guifg=DarkRed
hi Identifier cterm=NONE ctermfg=DarkBlue    gui=NONE guifg=DarkBlue
hi PreProc    cterm=NONE ctermfg=DarkGreen   gui=NONE guifg=DarkGreen
hi Special    cterm=NONE ctermfg=LightRed    gui=NONE guifg=deeppink
hi Statement  cterm=bold ctermfg=Blue       gui=bold guifg=blue
hi Type       cterm=NONE ctermfg=Blue       gui=bold guifg=blue

"just patch here
hi clear LineNr
hi clear CursorLineNr
hi clear CursorLine
hi clear Comment
hi clear ColorColumn

hi! CursorLineNr term=bold cterm=bold        ctermfg=Blue
hi! LineNr       term=none cterm=none        ctermfg=White
hi! CursorLine   cterm=none
hi! Comment      ctermfg=DarkGreen  guifg=Red
hi! ColorColumn  ctermbg=Gray
hi! VertSplit    ctermfg=Black ctermbg=Blue
hi! Todo         ctermbg=Black ctermbg=DarkRed guibg=Red guifg=Black

hi StatusLine ctermfg=Black ctermbg=Red
hi StatusLineNC ctermfg=Black ctermbg=Blue

" vim: sw=2
"
