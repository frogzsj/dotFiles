" Vim color file
" Adapter from https://github.com/liuchengxu/space-vim-dark
hi clear

if v:version > 580
    hi clear
    if exists('g:syntax_on')
        syntax reset
    endif
endif

" let g:colors_name='space-vim-dark'
let g:colors_name='mine'

function! SetGuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guifg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guibg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

call SetGuiFor('Normal', '#bcbcbc', '#212026')
call SetGuiFor('Visual', '#e4e4e4', '#34323e')
call SetGuiFor('Cursor', '#121212', '#ffff87', 'bold')
call SetGuiFor('VertSplit', '#ffffff', '#ffffff')

call SetGuiFor('LineNr', '#5f0000', '#121212')
call SetGuiFor('CursorLine', '', '#303030')
call SetGuiFor('CursorLineNr', '#f9bb00', '#303030')
call SetGuiFor('ColorColumn', '', '#121212')
call SetGuiFor('WildMenu', '#303030', '#86dc2f', 'bold')

call SetGuiFor('String', '#87ff87', '')
call SetGuiFor('Number', '#f9bb00', '')
hi link Float Number
call SetGuiFor('Boolean', '#4f97d7', '', 'bold')
call SetGuiFor('Constant', '#bcbcbc', '', 'bold')
call SetGuiFor('Character', '#af0087', '')

call SetGuiFor('Debug', '#303030', '#fff069')
call SetGuiFor('Exception', '#FF4848', '', 'bold')
call SetGuiFor('Function', '#f9bb00', '', 'bold')
call SetGuiFor('Identifier', '#e18254', '')
call SetGuiFor('Operator', '#ff005f', '')
call SetGuiFor('Delimiter', '#121212', '#f9bb00')
call SetGuiFor('Define', '#FF73B9', '')
hi link Include Define
hi link Macro Define
call SetGuiFor('PreProc', '#FF62B0', '', 'bold')
call SetGuiFor('PreCondit', '#FF62B0', '')

call SetGuiFor('Conditional', '#ffafaf', '', 'bold')
hi link Repeat Conditional
hi link Structure Conditional
hi link Keyword Conditional
call SetGuiFor('Statement', '#FF62B0', '', 'none')
call SetGuiFor('Directory', '#008700', '')
call SetGuiFor('Type', '#4f97d7', '', 'none')
call SetGuiFor('Typedef', '#4f97d7', '')
call SetGuiFor('StorageClass', '#e18254', '')
call SetGuiFor('Special', '#ff005f', '')
call SetGuiFor('SpecialKey', '#af0087', '')
call SetGuiFor('SpecialChar', '#af0087', '')
call SetGuiFor('SpecialComment', '#544a65', '')

call SetGuiFor('Comment', '#585858', '')
call SetGuiFor('Todo', '#af0000', 'NONE', 'boldunderline')
call SetGuiFor('Folded', '#eeeeee', '#65737e')
call SetGuiFor('Question', '#b4d1b6', '#121212', 'italic')
call SetGuiFor('Label', '#ff005f', '')

call SetGuiFor('Search', '#f9bb00', '#000087')
call SetGuiFor('IncSearch', '#f9bb00', '#005f00')
call SetGuiFor('MatchParen', '#86dc2f', 'NONE', 'boldunderline')

call SetGuiFor('DiffAdd', '', '#005f00')
call SetGuiFor('DiffChange', '#fff069', '#1c1c1c')
call SetGuiFor('DiffDelete', '#e0211d', '#949494')
call SetGuiFor('DiffText', '', '#808000')

"" TODO Popup menu
"call s:hi('Pmenu'      , 141 , s:bg1 , 'None' , 'None')
"call s:hi('PmenuSel'   , 251 , 97    , 'None' , 'None')
"call s:hi('PmenuSbar'  , 28  , 233   , 'None' , 'None')
"call s:hi('PmenuThumb' , 160 , 97    , 'None' , 'None')

call SetGuiFor('Warning', '#1c1c1c', '#808000', 'bold')
call SetGuiFor('WarningMsg', '#1c1c1c', '#808000', 'bold')
call SetGuiFor('Error', '#1c1c1c', '#af0000', 'bold')
call SetGuiFor('ErrorMsg', '#1c1c1c', '#af0000', 'bold')

"" css
hi link cssTagName Statement
hi link cssProp Label
"
"" sh
hi link shSet StorageClass
hi link shLoop Conditional
hi link shFunctionKey Function
"
"" vimL
hi link vimLet StorageClass
hi link vimFuncKey Function
hi link vimCommand Statement
hi link vimGroup Conditional
hi link vimHiGroup PreProc
"
"" javascript
hi link jsString String
hi link jsAsyncKeyword Type
call SetGuiFor('jsBraces', '#c269fe', '', '')
call SetGuiFor('jsObjectBraces', '#c269fe', '', '')
call SetGuiFor('jsBrackets', '#ffff87', '', '')
call SetGuiFor('jsParens', '#FF4848', '', '')
hi link jsFuncParens jsParens
call SetGuiFor('jsParensIfElse', '#ffafaf', '', '')
hi link jsParensSwitch jsParensIfElse
hi link jsParensRepeat jsParensIfElse
call SetGuiFor('jsModuleKeyword', '#4f97d7', '')
call SetGuiFor('jsArrowFunction', '#4f97d7', '')
call SetGuiFor('jsClassDefinition', '#4f97d7', '')
"
"" json
hi link jsonStringSQError Error
"
"" xml i.e. React
call SetGuiFor('xmlTag', '', '', 'bold')
call SetGuiFor('xmlTagName', '#ff005f', '')
call SetGuiFor('xmlEndTag', '#4e4e4e', '')
"
"" html
hi link htmlSpecialTagName xmlTagName
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ALE
call SetGuiFor('ALEErrorSign', '#e0211d', '#121212')
call SetGuiFor('ALEWarningSign', '#f9bb00', '#121212')
"
"" vim-gitgutter
call SetGuiFor('GitGutterAdd', '#86dc2f', '#121212')
call SetGuiFor('GitGutterChange', '#ffff00', '#121212')
call SetGuiFor('GitGutterDelete', '#af0000', '#121212')
call SetGuiFor('GitGutterChangeDelete', '#af0000', '#121212')
"
"" NERDTree
call SetGuiFor('NERDTreeCWD', '#f9bb00', '', 'bold')
call SetGuiFor('NERDTreeUp', '#ffff87', '', 'bold')
call SetGuiFor('NERDTreeDir', '#e18254', '', 'bold')
call SetGuiFor('NERDTreeDirSlash', '#af0000', '', 'bold')
call SetGuiFor('NERDTreeOpenable', '#f9bb00', '', 'bold')
call SetGuiFor('NERDTreeClosable', '#ffff87', '', 'bold')
"
"" Must be at the end, because of ctermbg=234 bug.
"" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
