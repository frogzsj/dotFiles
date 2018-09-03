" == VimPlug ==
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'

Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'moll/vim-node'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'vim-scripts/SyntaxComplete'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'jaxbot/syntastic-react'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'gorodinskiy/vim-coloresque', { 'for': 'javascript,css,scss,sass' }

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

Plug 'w0rp/ale'
Plug 'obxhdx/vim-auto-highlight'

Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'valloric/MatchTagAlways'
Plug 'flazz/vim-colorschemes'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

hi LineNr ctermbg=NONE guibg=NONE
colorscheme space-vim-dark
" colorscheme hybrid

set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set relativenumber number
set laststatus=2  " always show status bar
set hls " highlight search
set ignorecase
set smartcase
set incsearch
set textwidth=130
set linespace=3
set colorcolumn=+1
set title
set nocompatible
filetype on
if has('gui_running')
  set guifont=LektonNerdFontCompleteM-Regular:h21
  set termguicolors
endif
" .swp strategy for Git reasons
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set undofile
set undodir=~/.vim/backup
let mapleader = ' '
nnoremap ; :
nnoremap : ;
nnoremap <D-j> <C-d>
nnoremap <D-k> <C-u>
vnoremap <D-j> :m '>+1<CR>gv
vnoremap <D-k> :m '<-2<CR>gv
vnoremap < <gv
vnoremap > >gv
nnoremap <D-q> :q!<CR>
nnoremap <D-s> :w<CR>
inoremap <D-s> <Esc>:w<CR>i
vnoremap <D-s> :w<CR>
nnoremap <D-r> :%s/
inoremap <D-r> <Esc>:%s/
vnoremap <D-r> :%s/
nnoremap <D-b> ``
nnoremap <D-n> *
nnoremap <D-.> `.
nnoremap <D-e> :NERDTreeToggle<CR>
nnoremap <D-p> :GFiles<CR>
nnoremap <D-P> :Files<CR>
nnoremap <D-f> :Ag<CR>
nnoremap <D-/> :TComment<CR>
nnoremap <D-d> <C-]>
autocmd BufWritePost * call system("ctags -R")
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bb :bprev<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wc. :close<CR>
nnoremap <leader>wch <C-w>h:close<CR>
nnoremap <leader>wcj <C-w>j:close<CR>
nnoremap <leader>wck <C-w>k:close<CR>
nnoremap <leader>wcl <C-w>l:close<CR>
nnoremap <leader>om %
nnoremap <leader>oc cs
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gc :Magit<CR>
nnoremap <leader>to :terminal<CR>
nnoremap <leader>q @q
" NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeIndicatorMapCustom = {
  \ 'Modified': '!',
  \ 'Staged': '$',
  \ 'Untracked': '?',
  \ 'Renamed': '»',
  \ 'Unmerged': '=',
  \ 'Deleted': '✘',
  \ 'Dirty': '~',
  \ 'Clean': '✔︎',
  \ 'Ignored': '☒',
  \ 'Unknown': '⁇'
  \ }
" TComment
" Syntastic
let g:ale_sign_error = '⌦'
let g:ale_sign_warning = '⦿'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:mta_filetypes = {
      \  'javascript.jsx': 1,
      \  'javascript.js': 1
      \}
" Ale
let b:ale_fixers = {'javascript': ['eslint'], 'json': ['jsonlint'], 'css': ['csslint'], 'scss': ['sass-lint']}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
filetype plugin indent on
syntax on
" Devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" Airline
let g:airline_theme='bubblegum'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Snippets
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<C-b>'
let g:UltiSnipsJumpBackwardTrigger='<C-z>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories = [$HOME + '/dotFiles/vim']

" Remove trailing whitespace on save
function! s:RemoveTrailingWhitespaces()
  "Save last cursor position
  let l = line('.')
  let c = col('.')

  %s/\s\+$//ge

  call cursor(l,c)
endfunction
au BufWritePre * :call <SID>RemoveTrailingWhitespaces()

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( '%' )
    exe g:markedWinNum . 'wincmd w'
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( '%' )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . 'wincmd w'
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nnoremap <silent> <D-m> :call MarkWindowSwap()<CR>
nnoremap <silent> <D-g> :call DoWindowSwap()<CR>
