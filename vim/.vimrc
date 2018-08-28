
set nocompatible              " be iMproved, required
filetype off                  " required
" == VimPlug ==
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

Plug 'tomtom/tcomment_vim'

Plug 'scrooloose/syntastic'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
Plug 'vim-scripts/SyntaxComplete'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jaxbot/syntastic-react', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javacript' }

Plug 'gorodinskiy/vim-coloresque', { 'for': 'css,scss,sass' }

Plug 'vim-scripts/RltvNmbr.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'obxhdx/vim-auto-highlight'

Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'valloric/MatchTagAlways'
Plug 'flazz/vim-colorschemes'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

colorscheme space-vim-dark
hi LineNr ctermbg=NONE guibg=NONE
" colorscheme hybrid

set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set relativenumber number
set laststatus=2  " always show status bar
set hls " highlight search
set ignorecase
set smartcase
set incsearch
set textwidth=130
set colorcolumn=+1
set termguicolors
set guifont=LektonNerdFontCompleteM-Regular:h21
set title
:set guioptions-=T
" .swp strategy for Git reasons
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set undofile
set undodir=~/.vim/backup
nnoremap <D-j> <C-d>
nnoremap <D-k> <C-u>
vnoremap <D-j> :m '>+1<CR>gv
vnoremap <D-k> :m '<-2<CR>gv
map <D-q> :q<CR>
nnoremap <D-s> :w<CR>
inoremap <D-s> <Esc>:w<CR>i
vnoremap <D-s> :w<CR>
map <D-n> :bnext<CR>
map <D-b> :bprev<CR>
map <D-f> :Ag<CR>
map <D-r> :%s/
map <D-;> :
map <D-w> <C-w>
"map <D-o>
"map <D-g>
"map <D-t>
"map <D-l>
"map <D-m>
" NERDTree
map <D-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" CtrlP
map <D-p> :CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,DS_STORE
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" TComment
map <D-/> :TComment<CR>
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
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
let g:airline_theme='hybrid'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Remove trailing whitespace on save
function! s:RemoveTrailingWhitespaces()
  "Save last cursor position
  let l = line(".")
  let c = col(".")

  %s/\s\+$//ge

  call cursor(l,c)
endfunction

au BufWritePre * :call <SID>RemoveTrailingWhitespaces()
