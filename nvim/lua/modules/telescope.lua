local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<A-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<A-r>"] = fb_actions.rename,
          ["<A-m>"] = fb_actions.move,
          ["<A-y>"] = fb_actions.copy,
          ["<A-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
          ["<bs>"] = fb_actions.backspace,
        },
      },
    },
  },
})
telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)

vim.keymap.set("n", "<leader>d", builtin.diagnostics)

vim.keymap.set("n", "<leader>gl", builtin.git_commits)
vim.keymap.set("n", "<leader>gs", builtin.git_status)
vim.keymap.set("n", "<leader>gb", builtin.git_branches)

vim.keymap.set("n", "<leader>br", telescope.extensions.file_browser.file_browser)
vim.keymap.set("n", "<leader>bb", function ()
  telescope.extensions.file_browser.file_browser({path = "%:p:h", select_buffer = true})
end)

vim.api.nvim_set_hl(0, "TelescopeBorder", {fg="#abb2bf"})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg="#5c6370"})
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {fg="#5c6370"})
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {fg="#5c6370"})
