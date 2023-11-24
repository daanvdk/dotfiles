-- Plugin Section
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
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

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'f-person/git-blame.nvim'
Plug 'tpope/vim-commentary'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

vim.call('plug#end')

-- Config Section

-- tab config
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.backspace = 'indent,eol,start'
vim.o.smartindent = false
vim.o.mouse = ''
vim.o.cmdheight = 0
vim.g.gitgutter_show_msg_on_hunk_jumping = 0

-- Telescope
local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions
local action_state = require("telescope.actions.state")

function dir_to_grep()
    local entry = action_state.get_selected_entry()
    opts = { cwd = entry.path or entry.filename }
    actions.close()
    require("telescope.builtins").live_grep(opts)
end

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
                    ["<C-f>"] = dir_to_grep,
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
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require "telescope.builtin".diagnostics({ bufnr = 0 })<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua require "telescope.builtin".lsp_document_symbols({symbols = {"class"}})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>C', '<cmd>lua require "telescope.builtin".lsp_workspace_symbols({symbols = {"class"}})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua require "telescope.builtin".lsp_document_symbols({symbols = {"function"}})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>M', '<cmd>lua require "telescope.builtin".lsp_workspace_symbols({symbols = {"function"}})<CR>', { noremap = true })
-- LSP
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require "telescope.builtin".lsp_definitions()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require "telescope.builtin".lsp_references()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[d', '<cmd>silent lua vim.diagnostic.goto_prev({ float = false })<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ']d', '<cmd>silent lua vim.diagnostic.goto_next({ float = false })<CR>', { noremap = true })

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

-- LSP lines
require("lsp_lines").setup()

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
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticVirtualTextWarn DiagnosticWarn
hi! link DiagnosticVirtualTextInfo DiagnosticInfo
hi! link DiagnosticVirtualTextHint DiagnosticHint
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
vim.diagnostic.config({ virtual_text = false, signs = false })
navic = require 'nvim-navic'

-- Setup lualine
local custom_onedark = require 'lualine.themes.onedark'
custom_onedark.normal.c.fg = custom_onedark.normal.b.fg

local function display_current_macro()
    local reg = vim.fn.reg_recording()
    return string.format(" recording %s", reg)
end

local function show_current_macro()
    local reg = vim.fn.reg_recording()
    return reg ~= ''
end

local current_macro = {
    display_current_macro,
    cond = show_current_macro,
    color = { fg = '#e06c75', gui = 'bold' },
}

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
        lualine_x = {current_macro, 'progress'},
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

local signs = { Error = '', Warning = '', Hint = '', Information = '' }
for type, icon in pairs(signs) do
    local hl = 'LspDiagnosticsSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Setup autocomplete
local cmp = require 'cmp'

vim.o.completeopt = 'menu,menuone,noselect'

local window_opts = {
    winhighlight = "Normal:Normal,FloatBorder:Comment,CursorLine:Visual,Search:None",
}

cmp.setup({
    mapping = {
        ['<C-n>'] = function()
            if cmp.visible() then
                local types = require 'cmp.types'
                cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
            else
                cmp.complete()
            end
        end,
        ['<C-p>'] = function()
            if cmp.visible() then
                local types = require 'cmp.types'
                cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
            else
                cmp.complete()
            end
        end,
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = require('lspkind').cmp_format({ mode = 'symbol' }),
    },
    window = {
        completion = cmp.config.window.bordered(window_opts),
        documentation = cmp.config.window.bordered(window_opts),
    },
    experimental = {
        ghost_text = true,
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

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require 'lspconfig'

local servers = {
    pylsp = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                flake8 = { enabled = true },
                mccabe = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
            },
        },
    },
    tsserver = {},
    zls = {},
    hls = {},
}
for server, settings in pairs(servers) do
    local config = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = settings,
    }
    lspconfig[server].setup(config)
end

-- Setup treesitter
require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim 
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, 
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
}

-- Gitgutter
vim.o.updatetime = 250
vim.g.gitgutter_sign_added = '▌'
vim.g.gitgutter_sign_modified = '▌'
vim.g.gitgutter_sign_modified_removed = '▌'

-- indent line
vim.g.indent_blankline_show_trailing_blankline_indent = false
