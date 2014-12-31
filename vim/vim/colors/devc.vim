" term colorscheme
hi clear
set background=light
set t_Co=256
let g:colors_name = 'devc'
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
exec 'hi! ' . 'Normal'        . ' ctermfg=' . s:white       . ' ctermbg=' . s:black     . ' cterm=' . s:none
exec 'hi! ' . 'Operator'      . ' ctermfg=' . s:gray        . ' ctermbg=' . s:black     . ' cterm=' . s:none
exec 'hi! ' . 'PMenuThumb'    . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
exec 'hi! ' . 'PMenuSbar'     . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
exec 'hi! ' . 'Pmenu'         . ' ctermfg=' . s:darkblue    . ' ctermbg=' . s:black     . ' cterm=' . s:none
exec 'hi! ' . 'PmenuSel'      . ' ctermfg=' . s:black       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
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
exec 'hi! ' . 'VertSplit'     . ' ctermfg=' . s:black       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
exec 'hi! ' . 'Visual'        . ' ctermfg=' . s:black       . ' ctermbg=' . s:darkblue  . ' cterm=' . s:none
exec 'hi! ' . 'WarningMsg'    . ' ctermfg=' . s:red         . ' ctermbg=' . s:black     . ' cterm=' . s:none
exec 'hi! ' . 'WildMenu'      . ' ctermfg=' . s:black       . ' ctermbg=' . s:darkgray  . ' cterm=' . s:none

hi! link Number           Constant
hi! link String           Constant
hi! link Boolean          Constant
hi! link Character        Constant
hi! link Float            Constant
hi! link Statement        Keyword

