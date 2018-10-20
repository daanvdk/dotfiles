set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'joshdick/onedark.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-scripts/paredit.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = '%02l:%02c %02p%%'
let g:airline#extensions#whitespace#enabled = 0
let g:vim_json_syntax_conceal = 0
let g:paredit_electric_return = 0
let g:ctrlp_custom_ignore = 'node_modules\|__pycache__\|DS_Store\|git'
set laststatus=2
set number
set conceallevel=0
syntax on

colorscheme onedark
let g:indentLine_char = '▏'

let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['^__pycache__$[[dir]]']
set fillchars+=vert:\ 
highlight LineNr ctermfg=239
highlight Comment ctermfg=243
highlight VertSplit ctermbg=234
highlight StatusLine ctermbg=0
highlight ColorColumn ctermbg=236
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set bs=2
set nosmartindent

set hidden
set splitbelow
set splitright
nnoremap <C-F> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-B> :bprev<CR>
nnoremap <C-N> :bnext<CR>

set timeoutlen=1000 ttimeoutlen=0
