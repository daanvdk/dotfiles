-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Add packages
require("lazy").setup({
  "navarasu/onedark.nvim",
  "christoomey/vim-tmux-navigator",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "editorconfig/editorconfig-vim",
  {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},

  {"vonheikemen/lsp-zero.nvim", branch = "v3.x"},
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-telescope/telescope-file-browser.nvim",

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "nvim-treesitter/nvim-treesitter-textobjects",

  "nvim-lualine/lualine.nvim",
  {"akinsho/git-conflict.nvim", version = "*", config = true},
})
