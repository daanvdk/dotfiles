-- Plugin Section
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

-- Dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
-- Telescope
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

Plug 'lukas-reineke/indent-blankline.nvim'

vim.call('plug#end')

-- Config Section

-- Defx
-- This is still in vimscript since autocmd is not supported yet in lua
vim.cmd([[
autocmd FileType defx call Defx_my_settings()

function! Defx_my_settings() abort
    nnoremap <silent><buffer><expr> l
    \ defx#is_directory()
    \ ? defx#do_action('open_directory')
    \ : defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> <cr>
    \ defx#is_directory()
    \ ? defx#do_action('open_directory')
    \ : defx#do_action('multi', ['drop', 'quit']))
    nnoremap <silent><buffer><expr> v
    \ defx#is_directory()
    \ ? defx#do_action('open_directory')
    \ : defx#do_action('multi', [['drop', ':vsplit'], 'quit'])
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> n
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> a
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
]])

-- tab config
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.backspace = 'indent,eol,start'
vim.o.smartindent = false

-- key remappings
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>', { noremap = true })
-- Quicker pane switching
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
-- Telescope shortcuts
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
-- Defx shortcuts
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Defx `escape(expand(\'%:p:h\'), \' :\')` -search=`expand(\'%:p\')`<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>br', '<cmd>Defx `escape(getcwd(), \' :\')`<cr>', { noremap = true })
-- LSP
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true })

-- Remap * in visual mode to search for the current selection instead of
-- current word since current word already works in normal mode anyway
vim.api.nvim_set_keymap('x', '*', '"zy<Esc>/\\V<C-R>z<cr>', { noremap = true })

-- Get rid of annoying hard to exit modes that happen on typos of :q
vim.api.nvim_set_keymap('n', 'q:', '', { noremap = true })
vim.api.nvim_set_keymap('n', 'Q', '', { noremap = true })

-- visual config
vim.o.number = true
vim.o.colorcolumn = '80'
vim.cmd('colorscheme onedark')
vim.cmd('syntax on')

vim.o.guicursor = 'n:block-CursorNormal,i:hor10-CursorInsert,v:block-CursorVisual'
vim.g.vim_json_syntax_conceal = 0

-- this is still in vimscript since highlight is not supported yet in lua
vim.cmd([[
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
hi! LspDiagnosticsUnderlineWarning gui=undercurl guisp=#e5c07b
hi! LspDiagnosticsUnderlineError gui=undercurl guisp=#e06c75
hi! LspDiagnosticsUnderlineHint gui=undercurl guisp=#c678dd
hi! LspDiagnosticsUnderlineInformation gui=undercurl guisp=#61afef
hi IndentBlanklineChar guifg=#363c48
]])

-- copy/paste
vim.o.clipboard = 'unnamed'

-- preview replace
vim.o.inccommand = 'nosplit'

-- sensible splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Setup lsp
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}
)
vim.cmd([[
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help({ focusable = false })
]])

local servers = {
    pylsp = {
        configurationSources = { 'flake8' },
        flake8 = { enabled = true }
    },
    tsserver = {},
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require 'lspconfig'
for server, extra_config in pairs(servers) do
    local config = { capabilities = capabilities }
    for k, v in pairs(extra_config) do
        config[k] = v
    end
    lspconfig[server].setup(config)
end

local signs = { Error = '', Warning = '', Hint = '', Information = '' }
for type, icon in pairs(signs) do
    local hl = 'LspDiagnosticsSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Setup lualine
local custom_onedark = require 'lualine.themes.onedark'
custom_onedark.normal.c.bg = '#282c34'
custom_onedark.inactive.c.bg = '#282c34'
require 'lualine'.setup {
    options = {
        theme = 'onedark',
    },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {'diagnostics', sources={'nvim_lsp'}}},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
}

-- Setup autocomplete
local cmp = require 'cmp'

vim.o.completeopt = 'menu,menuone,noselect'

cmp.setup({
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = require'lspkind'.cmp_format({with_text = false, maxwidth = 50}),
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup treesitter
require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
}

-- Gitgutter
vim.o.updatetime = 250
vim.g.gitgutter_sign_added = '▌'
vim.g.gitgutter_sign_modified = '▌'
vim.g.gitgutter_sign_modified_removed = '▌'

-- indent line
vim.g.indent_blankline_show_trailing_blankline_indent = false
