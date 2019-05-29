set hidden

call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'markonm/traces.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joshdick/onedark.vim'

" JSX editing
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

let g:ctrlp_map='<space>f'
let g:ctrlp_custom_ignore = 'node_modules\|__pycache__\|DS_Store\|git\|deps\|_build\|build\|venv'

" airline
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = '%02l:%02c %02p%%'
let g:airline#extensions#whitespace#enabled = 0
let g:vim_json_syntax_conceal = 0

" functions
nno <silent> <space>e :NERDTreeToggle<cr>

" tab config
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set bs=2
set nosmartindent

" sensible splits
set splitbelow
set splitright

" key remappings
tnoremap <ESC> <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-\><C-N><C-w>h
nnoremap <C-j> <C-\><C-N><C-w>j
nnoremap <C-k> <C-\><C-N><C-w>k
nnoremap <C-l> <C-\><C-N><C-w>l

" auto terminal mode
au TermOpen * setlocal nonumber
au TermOpen * startinsert
au BufEnter term://* startinsert

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['^__pycache__$[[dir]]', '^\.git$[[dir]]', '^deps$[[dir]]', '^_build$[[dir]]']

" visual config
set number
set colorcolumn=80
colorscheme onedark

filetype plugin indent on
syntax on

hi EndOfBuffer ctermfg=bg guifg=bg
set guicursor=n:block-CursorNormal,i:hor10-CursorInsert,v:block-CursorVisual
hi VertSplit ctermfg=8
set fillchars+=vert:\│

set clipboard=unnamed

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
