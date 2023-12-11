local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, {buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {lsp_zero.default_setup},
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

for type, _ in pairs(signs) do
  vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. type, { link = "Diagnostic" .. type })
end

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
