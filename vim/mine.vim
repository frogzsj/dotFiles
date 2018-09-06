" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:	September 25 2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mine"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#333333 ctermbg=236
  hi MatchParen   guifg=#92ff26 guibg=#555555 gui=BOLD,UNDERLINE
  hi Pmenu 		guifg=#ffffff guibg=#444444 ctermfg=255 ctermbg=238
  hi PmenuSel 	guifg=#000000 guibg=#b1d631 ctermfg=0 ctermbg=148
endif

" General colors
hi Cursor 		guifg=#111111    guibg=#faff00 gui=none ctermbg=241
hi Normal 		guifg=#e2e2e5 guibg=#202020 gui=none ctermfg=253 ctermbg=234
hi NonText 		guifg=#808080 guibg=#303030 gui=none ctermfg=244 ctermbg=235
hi LineNr 		guifg=#808080 guibg=#111111 gui=none ctermfg=244 ctermbg=232
hi VertSplit 	guifg=#ffffff guibg=#ffffff gui=none ctermfg=238 ctermbg=238
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none ctermbg=4 ctermfg=248
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold ctermfg=254 cterm=bold
hi Visual		guifg=#faf4c6 guibg=#3c414c gui=none ctermfg=254 ctermbg=4
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none ctermfg=244 ctermbg=236

hi Comment 		guifg=#808080 gui=italic ctermfg=244
hi Todo        guifg=#ffffff guibg=NONE    gui=BOLD,UNDERLINE
hi Boolean      guifg=#49a1e5 gui=bold ctermfg=148
hi String 		guifg=#b1d631 gui=italic ctermfg=148
hi Identifier 	guifg=#48a020 gui=none ctermfg=148
hi Function 	guifg=#ffffff gui=bold ctermfg=255
hi Type 		guifg=#7e8aa2 gui=none ctermfg=103
hi PreProc  guifg=#ce6993 gui=none
hi Statement 	guifg=#f799ec gui=none ctermfg=103
hi Keyword		guifg=#ff9800 gui=none ctermfg=208
hi Constant 	guifg=#fffdba gui=none  ctermfg=208
hi Number		guifg=#ff9800 gui=none ctermfg=208
hi Special		guifg=#ff84e0 gui=none ctermfg=208
hi Conditional guifg=#a0b3db guibg=NONE gui=bold
hi link Repeat Conditional
hi link Operator Normal

" JS
hi link jsString String
hi jsModuleKeyword guifg=#fffdba gui=none
hi xmlEndTag guifg=#afafaf gui=none
hi xmlTagName guifg=#ab53cc gui=none
" Vim
hi link vimLet Type
hi link vimFuncKey Function
hi link vimCommand Conditional
hi link vimGroup Constant
hi link vimHiGroup String
