" Vim color file
" Colorscheme by ghl

hi clear

let colors_name = 'lingo_light'
set background=light

hi Normal                               guifg=Black              guibg=#c0c0c0



hi ColorColumn                                                         guibg=#aaaaaa
hi Conceal                                    guifg=#005500            guibg=#e0e0e0
hi Cursor       gui=none                      guifg=White              guibg=Blue
hi CursorColumn gui=none                                               guibg=#aaaaaa
hi CursorLine   gui=none                                               guibg=#aaaaaa
hi CursorLineNr gui=bold                      guifg=White              guibg=#444444
hi DiffAdd                                                             guibg=LightBlue
hi DiffChange                                                          guibg=LightMagenta
hi DiffDelete                                 guifg=Blue               guibg=DarkGray
hi DiffText                                                            guibg=Red
hi Directory                                  guifg=Blue
hi ErrorMsg                                   guifg=Red                guibg=#c2c2c2
hi FoldColumn                                 guifg=Black              guibg=#bbbbbb
hi Folded                                     guifg=Black              guibg=#aaaaaa
hi IncSearch    gui=reverse
hi Label        gui=none                      guifg=#0022dd
hi LineNr                                     guifg=Black              guibg=#bbbbbb
hi MatchParen   gui=underline,italic,bold     guifg=DarkBlue           guibg=bg
hi ModeMsg      gui=bold                      guifg=#002500
hi MoreMsg                                    guifg=#002500
hi NonText                                    guifg=#252525            guibg=#dedede
hi PMenuSbar                                                           guibg=DarkBlue
hi PMenuThumb                                                          guibg=DarkGray
hi Pmenu                                      guifg=DarkBlue           guibg=#c2c2c2
hi PmenuSel                                   guifg=White              guibg=DarkBlue
hi Question                                   guifg=Red
hi Search                                     guifg=White              guibg=DarkBlue
hi SpecialKey                                 guifg=DarkBlue
hi StatusLine                                 guifg=Black              guibg=White
hi TabLine      gui=none                      guifg=Black              guibg=#c2c2c2
hi TabLineFill                                guifg=#c2c2c2
hi TabLineSel   gui=italic                    guifg=White              guibg=#000044
hi Title                                      guifg=Blue
hi VertSplit                                  guifg=#c2c2c2            guibg=Black
hi Visual                                     guifg=White              guibg=#222222
hi WarningMsg                                 guifg=White
hi WildMenu                                   guifg=Black              guibg=#222222

" syntax highlighting
hi Todo         gui=underline  guifg=DarkRed    guibg=bg
hi Comment      gui=none       guifg=#002500
hi Constant     gui=none       guifg=#004400
hi Identifier   gui=none       guifg=Blue
hi PreProc      gui=none       guifg=#002500
hi Special      gui=none       guifg=DarkGreen
hi Statement    gui=none       guifg=DarkBlue
hi Type	        gui=none       guifg=#0000bb
hi Operator     gui=none       guifg=Black

hi link  Number         Constant
hi link  String         Constant
hi link  Boolean        Constant
hi link  Character      Constant
hi link  Float          Constant
hi link  Identifier     Type
hi link  luaFunc        Type
hi link  luaFunction    Type


" vim: sw=2
