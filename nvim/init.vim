call plug#begin("~/.vim/plugged")
    " Plugin Section
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'tpope/vim-surround'

    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/nvim-compe'

    " dependencies
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    " telescope
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'editorconfig/editorconfig-vim'	

    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'navarasu/onedark.nvim'

    Plug 'pangloss/vim-javascript'
    Plug 'MaxMEllon/vim-jsx-pretty'

    Plug 'tpope/vim-fugitive'

    Plug 'airblade/vim-gitgutter'

    Plug 'f-person/git-blame.nvim'
    Plug 'tpope/vim-commentary'

    Plug 'Shougo/defx.nvim'
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
call plug#end()

" Config Section

" Defx

autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> l
    \ defx#is_directory()
    \ ? defx#do_action('open_directory')
    \ : defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> <cr>
    \ defx#is_directory()
    \ ? defx#do_action('open_directory')
    \ : defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> n
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <esc>
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
endfunction

call defx#custom#option('_', {
    \ 'split': 'floating',
    \ 'wincol': '15',
    \ 'winrow': '9',
    \ 'winwidth': &columns - 30,
    \ 'winheight': &lines - 18,
    \ 'winborder': 'single',
    \ 'columns': 'mark:indent:git:space:icons:space:filename',
    \ })

" tab config
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set bs=2
set nosmartindent

" key remappings
let mapleader=" "

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
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>bb <cmd>Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<cr>
nnoremap <leader>br <cmd>Defx `escape(getcwd(), ' :')`<cr>

" Remap * in visual mode to search for the current selection instead of
" current word since current word already works in normal mode anyway
xnoremap * "zy<Esc>/\V<C-R>z<cr>

" visual config
set number
set colorcolumn=80
colorscheme onedark

filetype plugin indent on
syntax on

set guicursor=n:block-CursorNormal,i:hor10-CursorInsert,v:block-CursorVisual
set fillchars+=vert:\│

let g:vim_json_syntax_conceal = 0
let g:netrw_banner=0

hi VertSplit ctermfg=8 guifg=#5c6370
hi link jsxComponentName jsxTagName
hi link jsxPunct Comment
hi link jsxDot jsxPunct
hi link jsxNamespace jsxPunct
hi link jsxCloseString jsxPunct
hi link jsxBraces Variable
hi link jsxEqual jsxBraces
hi LspDiagnosticsDefaultWarning guifg=#e5c07b
hi LspDiagnosticsDefaultError guifg=#e06c75
hi LspDiagnosticsDefaultHint guifg=#c678dd
hi LspDiagnosticsDefaultInformation guifg=#61afef

" ranger config
let g:rnvimr_enable_picker = 1

" copy/paste
set clipboard=unnamed

" preview replace
set inccommand=nosplit

" sensible splits
set splitbelow
set splitright

" lua setup
lua << EOF
    require 'lspconfig'.pylsp.setup {
        configurationSources = { "flake8" },
        flake8 = { enabled = true }
    }
    require 'lspconfig'.tsserver.setup {}

    local signs = { Error = "", Warning = "", Hint = "", Information = "" }
    for type, icon in pairs(signs) do
        local hl = "LspDiagnosticsSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    require 'lualine'.setup {
        options = {
            theme = 'onedark'
        }
    }
EOF

" Autocomplete
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
  \ 'path': v:true,
  \ 'buffer': v:true,
  \ 'nvim_lsp': v:true,
\ }

" Treesitter
lua <<EOF
    require 'nvim-treesitter.configs'.setup {
        highlight = { enable = true },
        indent = { enable = true }
    }
EOF

" Gitgutter
set updatetime=250
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
" let g:gitgutter_sign_removed = 'zz'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = '▌'

" Color shite
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"