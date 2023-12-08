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

require("lualine").setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {current_macro, 'progress'},
    lualine_y = {'location'},
    lualine_z = {},
  },
})
