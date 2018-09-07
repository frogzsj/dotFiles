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

" refer to http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
let s:color256 = {
      \ 0 : '#000000',  1 : '#800000',  2 : '#008000',  3 : '#808000',  4 : '#000080',  5 : '#800080',  6 : '#008080' , 7 : '#c0c0c0',
      \ 8 : '#808080',  9 : '#ff0000', 10 : '#00ff00', 11 : '#ffff00', 12 : '#0000ff', 13 : '#ff00ff', 14 : '#00ffff', 15 : '#ffffff',
      \ 16 : '#000000',  17 : '#00005f',  18 : '#000087',  19 : '#0000af',  20 : '#0000d7',  21 : '#0000ff',
      \ 22 : '#005f00',  23 : '#005f5f',  24 : '#005f87',  25 : '#005faf',  26 : '#005fd7',  27 : '#005fff',
      \ 28 : '#008700',  29 : '#00875f',  30 : '#008787',  31 : '#0087af',  32 : '#0087d7',  33 : '#0087ff',
      \ 34 : '#00af00',  35 : '#00af5f',  36 : '#00af87',  37 : '#00afaf',  38 : '#00afd7',  39 : '#00afff',
      \ 40 : '#00d700',  41 : '#00d75f',  42 : '#00d787',  43 : '#00d7af',  44 : '#00d7d7',  45 : '#00d7ff',
      \ 46 : '#00ff00',  47 : '#00ff5f',  48 : '#00ff87',  49 : '#00ffaf',  50 : '#00ffd7',  51 : '#00ffff',
      \ 52 : '#5f0000',  53 : '#5f005f',  54 : '#5f0087',  55 : '#5f00af',  56 : '#5f00d7',  57 : '#5f00ff',
      \ 58 : '#5f5f00',  59 : '#5f5f5f',  60 : '#5f5f87',  61 : '#5f5faf',  62 : '#5f5fd7',  63 : '#5f5fff',
      \ 64 : '#5f8700',  65 : '#5f875f',  66 : '#5f8787',  67 : '#5f87af',  68 : '#5f87d7',  69 : '#5f87ff',
      \ 70 : '#5faf00',  71 : '#5faf5f',  72 : '#5faf87',  73 : '#5fafaf',  74 : '#5fafd7',  75 : '#5fafff',
      \ 76 : '#5fd700',  77 : '#5fd75f',  78 : '#5fd787',  79 : '#5fd7af',  80 : '#5fd7d7',  81 : '#5fd7ff',
      \ 82 : '#5fff00',  83 : '#5fff5f',  84 : '#5fff87',  85 : '#5fffaf',  86 : '#5fffd7',  87 : '#5fffff',
      \ 88 : '#870000',  89 : '#87005f',  90 : '#870087',  91 : '#8700af',  92 : '#8700d7',  93 : '#8700ff',
      \ 94 : '#875f00',  95 : '#875f5f',  96 : '#875f87',  97 : '#875faf',  98 : '#875fd7',  99 : '#875fff',
      \ 100 : '#878700', 101 : '#87875f', 102 : '#878787', 103 : '#8787af', 104 : '#8787d7', 105 : '#8787ff',
      \ 106 : '#87af00', 107 : '#87af5f', 108 : '#87af87', 109 : '#87afaf', 110 : '#87afd7', 111 : '#87afff',
      \ 112 : '#87d700', 113 : '#87d75f', 114 : '#87d787', 115 : '#87d7af', 116 : '#87d7d7', 117 : '#87d7ff',
      \ 118 : '#87ff00', 119 : '#87ff5f', 120 : '#87ff87', 121 : '#87ffaf', 122 : '#87ffd7', 123 : '#87ffff',
      \ 124 : '#af0000', 125 : '#af005f', 126 : '#af0087', 127 : '#af00af', 128 : '#af00d7', 129 : '#af00ff',
      \ 130 : '#af5f00', 131 : '#af5f5f', 132 : '#af5f87', 133 : '#af5faf', 134 : '#af5fd7', 135 : '#af5fff',
      \ 136 : '#af8700', 137 : '#af875f', 138 : '#af8787', 139 : '#af87af', 140 : '#af87d7', 141 : '#af87ff',
      \ 142 : '#afaf00', 143 : '#afaf5f', 144 : '#afaf87', 145 : '#afafaf', 146 : '#afafd7', 147 : '#afafff',
      \ 148 : '#afd700', 149 : '#afd75f', 150 : '#afd787', 151 : '#afd7af', 152 : '#afd7d7', 153 : '#afd7ff',
      \ 154 : '#afff00', 155 : '#afff5f', 156 : '#afff87', 157 : '#afffaf', 158 : '#afffd7', 159 : '#afffff',
      \ 160 : '#d70000', 161 : '#d7005f', 162 : '#d70087', 163 : '#d700af', 164 : '#d700d7', 165 : '#d700ff',
      \ 166 : '#d75f00', 167 : '#d75f5f', 168 : '#d75f87', 169 : '#d75faf', 170 : '#d75fd7', 171 : '#d75fff',
      \ 172 : '#d78700', 173 : '#d7875f', 174 : '#d78787', 175 : '#d787af', 176 : '#d787d7', 177 : '#d787ff',
      \ 178 : '#d7af00', 179 : '#d7af5f', 180 : '#d7af87', 181 : '#d7afaf', 182 : '#d7afd7', 183 : '#d7afff',
      \ 184 : '#d7d700', 185 : '#d7d75f', 186 : '#d7d787', 187 : '#d7d7af', 188 : '#d7d7d7', 189 : '#d7d7ff',
      \ 190 : '#d7ff00', 191 : '#d7ff5f', 192 : '#d7ff87', 193 : '#d7ffaf', 194 : '#d7ffd7', 195 : '#d7ffff',
      \ 196 : '#ff0000', 197 : '#ff005f', 198 : '#ff0087', 199 : '#ff00af', 200 : '#ff00d7', 201 : '#ff00ff',
      \ 202 : '#ff5f00', 203 : '#ff5f5f', 204 : '#ff5f87', 205 : '#ff5faf', 206 : '#ff5fd7', 207 : '#ff5fff',
      \ 208 : '#ff8700', 209 : '#ff875f', 210 : '#ff8787', 211 : '#ff87af', 212 : '#ff87d7', 213 : '#ff87ff',
      \ 214 : '#ffaf00', 215 : '#ffaf5f', 216 : '#ffaf87', 217 : '#ffafaf', 218 : '#ffafd7', 219 : '#ffafff',
      \ 220 : '#ffd700', 221 : '#ffd75f', 222 : '#ffd787', 223 : '#ffd7af', 224 : '#ffd7d7', 225 : '#ffd7ff',
      \ 226 : '#ffff00', 227 : '#ffff5f', 228 : '#ffff87', 229 : '#ffffaf', 230 : '#ffffd7', 231 : '#ffffff',
      \
      \ 232 : '#080808', 233 : '#121212', 234 : '#1c1c1c', 235 : '#262626', 236 : '#303030', 237 : '#3a3a3a',
      \ 238 : '#444444', 239 : '#4e4e4e', 240 : '#585858', 241 : '#606060', 242 : '#666666', 243 : '#767676',
      \ 244 : '#808080', 245 : '#8a8a8a', 246 : '#949494', 247 : '#9e9e9e', 248 : '#a8a8a8', 249 : '#b2b2b2',
      \ 250 : '#bcbcbc', 251 : '#c6c6c6', 252 : '#d0d0d0', 253 : '#dadada', 254 : '#e4e4e4', 255 : '#eeeeee',
      \ }

let s:colors = {
      \ 16: '#292b2e', 24: '#3C8380', 28: '#c269fe', 30: '#2aa1ae', 36: '#20af81', 40: '#00ff00',
      \ 59: '#FF73B9', 68: '#4f97d7', 75: '#FF62B0', 76: '#86dc2f', 81: '#f9bb00', 88: '#330033',
      \ 104: '#df90ff', 114: '#67b11d', 128: '#e76a49', 135: '#B7B7FF', 136: '#dc752f', 139: '#d698fe',
      \ 140: '#b888e2', 141: '#9a9aba', 151: '#74BAAC', 160: '#e0211d', 161: '#E469FE', 167: '#ce537a',
      \ 168: '#ce537a', 169: '#bc6ec5', 171: '#6094DB', 173: '#e18254', 176: '#E697E6', 177: '#D881ED',
      \ 178: '#d1951d', 179: '#d4b261', 196: '#e0211d', 204: '#ce537a', 207: '#FF68DD', 214: '#FF4848',
      \ 218: '#d19a66', 225: '#FFC8C8', 229: '#fff06a', 233: '#303030', 234: '#212026', 235: '#292b2e',
      \ 236: '#34323e', 238: '#544a65', 241: '#534b5d', 243: '#65737e', 244: '#b4d1b6',
      \ }

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
call SetGuiFor('Constant', '#4f97d7', '')
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

call SetGuiFor('Conditional', '#00af00', '', 'bold')
hi link Repeat Conditional
hi link Structure Conditional
hi link Keyword Conditional
call SetGuiFor('Statement', '#00af00', '', 'none')
call SetGuiFor('Directory', '#008700', '')
call SetGuiFor('Type', '#c269fe', '', 'none')
call SetGuiFor('Typedef', '#c269fe', '')
call SetGuiFor('StorageClass', '#e18254', '', 'bold')
call SetGuiFor('Special', '#ff005f', '')
call SetGuiFor('SpecialKey', '#af0087', '')
call SetGuiFor('SpecialChar', '#af0087', '')
call SetGuiFor('SpecialComment', '#544a65', '')

call SetGuiFor('Comment', '#3a3a3a', '')
call SetGuiFor('Todo', '#af0000', 'NONE', 'boldunderline')
call SetGuiFor('Folded', '#eeeeee', '#65737e')
call SetGuiFor('Question', '#b4d1b6', '#121212', 'italic')
call SetGuiFor('Label', '#e18254', '')

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
call SetGuiFor('jsBraces', '#c269fe', '', 'bold')
call SetGuiFor('jsObjectBraces', '#c269fe', '', 'bold')
call SetGuiFor('jsBrackets', '#ffff87', '', 'bold')
call SetGuiFor('jsParens', '#4f97d7', '', 'bold')
call SetGuiFor('jsModuleKeyword', '#4f97d7', '')
call SetGuiFor('jsArrowFunction', '#4f97d7', '')
call SetGuiFor('jsClassDefinition', '#4f97d7', '')
"
"" json
hi link jsonStringSQError Error
"
"" xml i.e. React
call SetGuiFor('xmlTag', '#ffffaf', '')
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
call SetGuiFor('GitGutterDelete', '#af0000', #121212'')
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
