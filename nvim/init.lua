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
Plug "SmiteshP/nvim-navic"

-- Dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
-- Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

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

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'christoomey/vim-tmux-navigator'

vim.call('plug#end')

-- Config Section

-- tab config
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.backspace = 'indent,eol,start'
vim.o.smartindent = false
vim.o.cmdheight = 0

-- Telescope
local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions

require "telescope".setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    extensions = {
        file_browser = {
            mappings = {
                i = {
                    ["<C-e>"] = fb_actions.create,
                    ["<S-CR>"] = fb_actions.create_from_prompt,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-t>"] = fb_actions.move,
                    ["<C-y>"] = fb_actions.copy,
                    ["<C-d>"] = fb_actions.remove,
                    ["<C-o>"] = fb_actions.open,
                    ["<C-g>"] = fb_actions.goto_parent_dir,
                    ["<C-w>"] = fb_actions.goto_cwd,
                    ["<C-h>"] = fb_actions.toggle_hidden,
                    ["<C-s>"] = fb_actions.toggle_all,
                },
            },
        },
    },
}
require "telescope".load_extension "file_browser"

-- key remappings
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>', { noremap = true })
-- Telescope shortcuts
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require "telescope.builtin".find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require "telescope.builtin".live_grep()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>lua require "telescope".extensions.file_browser.file_browser({ path = vim.fn.expand("%:p:h") })<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>br', '<cmd>lua require "telescope".extensions.file_browser.file_browser()<cr>', { noremap = true })
-- LSP
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require "telescope.builtin".lsp_definitions()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require "telescope.builtin".lsp_references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua require "telescope.builtin".diagnostics({ bufnr = 0 })<CR>', { noremap = true })
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
autocmd CursorHold * lua vim.diagnostic.open_float({ focusable = false })
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help({ focusable = false })
]])

local servers = {
    pylsp = {
        configurationSources = { 'flake8' },
        flake8 = { enabled = true }
    },
    tsserver = {},
    zls = {},
}

navic = require 'nvim-navic'

-- Setup lualine
local custom_onedark = require 'lualine.themes.onedark'
custom_onedark.normal.c.fg = custom_onedark.normal.b.fg
require 'lualine'.setup {
    options = {
        theme = custom_onedark
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {'diagnostics', sources={'nvim_diagnostic'}}},
        lualine_c = {'filename', {
            navic.get_location,
            cond=navic.is_available,
            padding={left=1, right=0},
        }},
        lualine_x = {'progress'},
        lualine_y = {'location'},
        lualine_z = {},
    },
}

navic.setup({
    separator = "  ",
    highlight = true
})

vim.api.nvim_set_hl(0, "NavicSeparator", { fg = custom_onedark.normal.c.fg })

vim.cmd([[
hi NavicIconsFile guibg=#2c323c
hi NavicIconsModule guibg=#2c323c
hi NavicIconsNamespace guibg=#2c323c
hi NavicIconsPackage guibg=#2c323c
hi NavicIconsClass guibg=#2c323c
hi NavicIconsMethod guibg=#2c323c
hi NavicIconsProperty guibg=#2c323c
hi NavicIconsField guibg=#2c323c
hi NavicIconsConstructor guibg=#2c323c
hi NavicIconsEnum guibg=#2c323c
hi NavicIconsInterface guibg=#2c323c
hi NavicIconsFunction guibg=#2c323c
hi NavicIconsVariable guibg=#2c323c
hi NavicIconsConstant guibg=#2c323c
hi NavicIconsString guibg=#2c323c
hi NavicIconsNumber guibg=#2c323c
hi NavicIconsBoolean guibg=#2c323c
hi NavicIconsArray guibg=#2c323c
hi NavicIconsObject guibg=#2c323c
hi NavicIconsKey guibg=#2c323c
hi NavicIconsNull guibg=#2c323c
hi NavicIconsEnumMember guibg=#2c323c
hi NavicIconsStruct guibg=#2c323c
hi NavicIconsEvent guibg=#2c323c
hi NavicIconsOperator guibg=#2c323c
hi NavicIconsTypeParameter guibg=#2c323c
hi NavicText guibg=#2c323c
hi NavicSeparator guifg=#abb2bf guibg=#2c323c

hi TelescopeBorder guifg=#abb2bf
hi TelescopePromptBorder guifg=#5c6370
hi TelescopeResultsBorder guifg=#5c6370
hi TelescopePreviewBorder guifg=#5c6370
]])

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require 'lspconfig'
for server, extra_config in pairs(servers) do
    local config = {
        capabilities = capabilities,
        on_attach = on_attach
    }
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
        ['<C-n>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-p>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
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
