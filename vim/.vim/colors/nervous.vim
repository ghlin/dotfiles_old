" Vim color file nerv-ous
" by m4tf3r
"
" vim.org: http://www.vim.org/scripts/script.php?script_id=4764
" deviantArt: http://cmant.deviantart.com/art/NERV-ous-Vim-Colorscheme-412479243

" Modified by GHL <2012.2.9.ghl@gmail.com>

set background=dark
hi clear
if exists("syntax_on")
 syntax reset
endif
set t_Co=256
let colors_name = "nervous"

hi Normal       guifg=#b9c6e0  guibg=#1a1a1a gui=none
hi NonText      guibg=bg       guifg=#2e2733 gui=none
hi Comment      guifg=#615882  gui=italic
hi Constant     guifg=#8eaa29  gui=none
hi Cursor       guibg=White
" hi Cursor       guibg=#f0e68c  guifg=bg      gui=none
hi CursorLine   guibg=#000000  gui=none
hi CursorLineNr guifg=#7b4692
hi CursorColumn guibg=#000000  gui=none
hi ColorColumn  guibg=#262626  gui=none
hi Directory    guifg=#8eaa29  gui=none
hi Folded       guibg=#262626  guifg=#615882 gui=none
hi FoldColumn   guifg=#615882  guibg=bg
hi Function     guifg=#8eaa29  gui=none
hi Identifier   guifg=#8eaa29  gui=none
hi LineNr       guifg=#615882  guibg=#262626 gui=none
hi MatchParen   guifg=bg       guibg=#d096bb gui=italic,bold,underline
hi Number       guifg=#ab2315  gui=none
hi PreProc      guifg=#ededa3  gui=none
hi Statement    guifg=#7b4692  gui=bold
hi Special      guifg=#fe9e47  gui=bold
hi SpecialKey   guifg=#d096bb  gui=bold
hi StatusLine   guibg=#2e254f  guifg=fg      gui=none
hi StatusLineNC guifg=#615882  guibg=#2e2733 gui=none
hi String       guifg=#d05310  gui=none
hi StorageClass guifg=#8eaa29  gui=bold
hi Structure    guifg=#8eaa29  gui=bold
hi Todo         guifg=DarkRed  guibg=bg      gui=bold,underline
hi Type         guifg=#8eaa29  gui=bold
hi Title        guifg=#8676f2  gui=bold
hi Underlined   guifg=#8676f2  gui=underline,italic
hi VertSplit    guibg=#2e2733  guifg=#2e2733 gui=none
hi Visual       guibg=#400000  gui=none
hi IncSearch    guifg=bg       guibg=#ededa3 gui=none
hi Search       guifg=bg       guibg=#fe9e47 gui=none
hi Error        guifg=#f5e4e6  guibg=#ab2315 gui=bold,undercurl
hi ErrorMsg     guifg=#000000  guibg=#ab2315 gui=bold
hi WarningMsg   guifg=#000000  guibg=#fe9e47 gui=bold
hi TabLine      gui=none       guifg=White   guibg=bg
hi TabLineFill  guifg=bg
hi TabLineSel   gui=none       guifg=White   guibg=#615882
" hi Title guifg=White

hi Pmenu            guifg=#fe9e47        guibg=#2e2733
hi PmenuSel         guibg=#8eaa29        guifg=#000000 gui=italic
hi PmenuSbar        guibg=#2e2733        guifg=#2e2733
hi PmenuThumb       guibg=#7b4692        guifg=#7b4692


if has('spell')
        hi SpellBad   guisp=#ab2315 gui=undercurl
        hi SpellRare  guisp=#fe9e47 gui=undercurl
        hi SpellCap   guisp=#7b4692 gui=undercurl
        hi SpellLocal guisp=#8eaa29 gui=undercurl
endif

