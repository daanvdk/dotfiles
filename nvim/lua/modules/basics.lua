vim.g.mapleader = " "

vim.o.cmdheight = 0
vim.o.number = true
vim.o.colorcolumn = "80"
vim.o.guicursor = "n:block-CursorNormal,i:hor10-CursorInsert,v:block-CursorVisual"
vim.o.inccommand = "nosplit"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.clipboard = "unnamed"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

-- Remap * in visual mode to search for the current selection instead of
-- current word since current word already works in normal mode anyway
vim.api.nvim_set_keymap('x', '*', '"zy<Esc>/\\V<C-R>z<cr>', { noremap = true })
