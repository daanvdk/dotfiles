local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, {buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    pylsp = function ()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            configurationSources = {"flake8"},
            flake8 = {enabled = true},
            pycodestyle = {enabled = false},
          },
        },
      })
    end,
  },
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

for type, _ in pairs(signs) do
  vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. type, { link = "Diagnostic" .. type })
end
