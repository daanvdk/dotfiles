local navic = require("nvim-navic")

local function diff_source()
  if vim.b.gitsigns_status_dict == nil then
    return nil
  end

  return {
    added = vim.b.gitsigns_status_dict.added,
    modified = vim.b.gitsigns_status_dict.changed,
    removed = vim.b.gitsigns_status_dict.removed,
  }
end

navic.setup({
  separator = "  ",
  highlight = true,
})

local function display_breadcrumbs()
  return navic.get_location()
end

local function show_breadcrumbs()
  return navic.is_available()
end

local breadcrumbs = {
  display_breadcrumbs,
  cond = show_breadcrumbs,
  padding = {left = 1, right = 0},
}

local function display_current_macro()
  local reg = vim.fn.reg_recording()
  return string.format(" recording %s", reg)
end

local function show_current_macro()
  local reg = vim.fn.reg_recording()
  return reg ~= ""
end

local current_macro = {
  display_current_macro,
  cond = show_current_macro,
  color = {fg = "#e06c75", gui = "bold"},
}

local lualine = require("lualine")

local function wrap_hl(component, content, key, color)
  if component.symbol_hl_cache == nil then
    component.symbol_hl_cache = {}
  end

  local group = component.symbol_hl_cache[key]

  if not group then
    group = component:create_hl(color, key)
    component.symbol_hl_cache[key] = group
  end

  return component:format_hl(group) .. content .. component:get_default_hl()
end

local filename_symbols = {
  modified = "",
  readonly = "",
  unnamed = "New File",
}

local function filename_fmt(content, component)
  local unnamed = component.options.symbols.unnamed
  local modified = component.options.symbols.modified
  local readonly = component.options.symbols.readonly

  if content == unnamed then
    content = wrap_hl(component, content, "lualine_filename_unnamed", {fg = "#848b98", gui = "italic"})
  elseif content:sub(-#modified) == modified then
    content = content:sub(1, -#modified - 1) .. wrap_hl(component, modified, "lualine_filename_modified", {fg = "#61afef"})
  elseif content:sub(-#readonly) == readonly then
    content = content:sub(1, -#readonly - 1) .. wrap_hl(component, readonly, "lualine_filename_readonly", {fg = "#e86671"})
  end

  return content
end

local function searchcount_fmt(content)
  if content == "" then
    return ""
  end
  return " " .. content:sub(2, -2)
end

local searchcount = {
  "searchcount",
  fmt = searchcount_fmt,
  color = {fg = "#e5c07b", gui = "bold"},
}

local function conflicts()
  local count = require("git-conflict").conflict_count()
  if count == 0 then
    return ""
  elseif count == 1 then
    return "1 conflict"
  else
    return string.format("%d conflicts", count)
  end
end

lualine.setup({
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"diagnostics"},
    lualine_c = {
      {
        "filetype",
        icon_only = true,
        separator = {right = ""},
        padding = {left = 1, right = 0},
      },
      {"filename", symbols = filename_symbols, fmt = filename_fmt},
      breadcrumbs,
    },
    lualine_x = {
      current_macro,
      searchcount,
    },
    lualine_y = {
      {
        conflicts,
        color = {fg = "#c678dd", gui = "bold"},
      },
      {"diff", source = diff_source},
      "branch",
    },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filetype",
        colored = false,
        icon_only = true,
        separator = {right = ""},
        padding = {left = 1, right = 0},
      },
      {
        "filename",
        symbols = filename_symbols,
      },
    },
    lualine_x = {
      conflicts,
      {
        "diff",
        colored = false,
        source = diff_source,
      },
      "branch",
    },
    lualine_y = {},
    lualine_z = {},
  },
})

-- Since we only want to alter the bg we do this with vimscript
vim.cmd([[
hi NavicIconsFile guibg=#32353e
hi NavicIconsModule guibg=#32353e
hi NavicIconsNamespace guibg=#32353e
hi NavicIconsPackage guibg=#32353e
hi NavicIconsClass guibg=#32353e
hi NavicIconsMethod guibg=#32353e
hi NavicIconsProperty guibg=#32353e
hi NavicIconsField guibg=#32353e
hi NavicIconsConstructor guibg=#32353e
hi NavicIconsEnum guibg=#32353e
hi NavicIconsInterface guibg=#32353e
hi NavicIconsFunction guibg=#32353e
hi NavicIconsVariable guibg=#32353e
hi NavicIconsConstant guibg=#32353e
hi NavicIconsString guibg=#32353e
hi NavicIconsNumber guibg=#32353e
hi NavicIconsBoolean guibg=#32353e
hi NavicIconsArray guibg=#32353e
hi NavicIconsObject guibg=#32353e
hi NavicIconsKey guibg=#32353e
hi NavicIconsNull guibg=#32353e
hi NavicIconsEnumMember guibg=#32353e
hi NavicIconsStruct guibg=#32353e
hi NavicIconsEvent guibg=#32353e
hi NavicIconsOperator guibg=#32353e
hi NavicIconsTypeParameter guibg=#32353e
hi NavicText guibg=#32353e
hi NavicSeparator guifg=#abb2bf guibg=#32353e
]])
