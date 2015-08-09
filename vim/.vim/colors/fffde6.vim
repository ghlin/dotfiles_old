" Vim color file
" Colorscheme by ghl

hi clear

let colors_name = 'fffde6'
set background=light

hi Normal                               guifg=Black              guibg=#efede6


hi clear ColorColumn
hi ColorColumn                                                         guibg=#cccccc
hi Conceal                                    guifg=#0000ff            guibg=bg
hi Cursor       gui=none                      guifg=White              guibg=Blue
hi CursorColumn gui=italic,bold                                        guibg=bg
hi CursorLine   gui=none                                               guibg=#dddddd
hi CursorLineNr gui=bold                      guifg=Black
hi DiffAdd                                    guifg=DarkBlue           guibg=bg
hi DiffChange   gui=italic                    guifg=DarkGreen          guibg=bg
hi DiffDelete                                 guifg=Red                guibg=bg
hi DiffText                                                            guibg=bg
hi Directory                                  guifg=Blue
hi ErrorMsg                                   guifg=DarkRed            guibg=bg
hi FoldColumn                                 guifg=Black              guibg=#dddddd
hi Folded                                     guifg=Black              guibg=#dddddd
hi IncSearch    gui=reverse
hi Label        gui=none                      guifg=#0022dd
hi LineNr                                     guifg=Black              guibg=bg

hi clear MatchParen

hi MatchParen   gui=underline,italic,bold     guifg=DarkBlue
hi ModeMsg      gui=bold                      guifg=#002500
hi MoreMsg                                    guifg=#002500
hi NonText                                    guifg=#dddddd            guibg=#EEEDE6
hi PMenuSbar                                                           guibg=DarkBlue
hi PMenuThumb                                 guifg=DarkBlue           guibg=bg
hi Pmenu                                      guifg=Black              guibg=#dddddd
hi PmenuSel     gui=bold                      guifg=White              guibg=Black
hi Question                                   guifg=DarkRed
hi Search       gui=underline                 guifg=White              guibg=DarkBlue
hi SpecialKey   gui=bold                      guifg=Gray
hi StatusLine                                 guifg=#dddddd            guibg=Black
hi StatusLineNC                               guifg=Gray               guibg=Black
hi TabLine      gui=none                      guifg=Black              guibg=bg
hi TabLineFill                                guifg=bg
hi TabLineSel   gui=italic                    guifg=White              guibg=#000044
hi Title                                      guifg=Blue
hi VertSplit                                  guifg=bg                 guibg=Black
hi Visual                                     guifg=White              guibg=#222222
hi WarningMsg                                 guifg=DarkRed
hi WildMenu     gui=underline                 guifg=Black              guibg=DarkGray

" syntax highlighting
hi Todo         gui=underline,bold   guifg=DarkRed    guibg=bg
hi Comment      gui=none             guifg=DarkGreen
hi Constant     gui=none             guifg=#004400
hi Identifier   gui=none             guifg=Blue
hi PreProc      gui=none             guifg=#002500
hi Special      gui=none             guifg=DarkGreen
hi Statement    gui=bold             guifg=DarkBlue
hi Type         gui=bold             guifg=#0000bb
hi Keyword      gui=bold             guifg=#0000bb
hi Operator     gui=bold             guifg=Black

hi link  Number         Constant
hi link  String         Constant
hi link  Boolean        Constant
hi link  Character      Constant
hi link  Float          Constant
hi link  Identifier     Type
hi link  luaFunc        Type
hi link  luaFunction    Type


" vim: sw=2
