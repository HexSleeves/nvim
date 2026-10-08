-- Single place for every colorscheme in this config.
--
-- To switch themes, change `colorscheme` below. Options:
--   "oxocarbon"  | "zitchdog" | "dankcolors"      (configured here)
--   "tokyonight" | "catppuccin"                     (shipped with LazyVim)
--   ...or any other installed colorscheme name.
--
-- Saving this file hot-reloads the active theme. `:Theme <name>` switches at runtime.
-- Overriding `{ "LazyVim/LazyVim", opts = { colorscheme = "..." } }` elsewhere also works.
local colorscheme = "oxocarbon"

-- Custom base16 palette ("dankcolors"), plus highlight tweaks applied on top of it.
local dank_palette = {
  base00 = "#292c3c",
  base01 = "#292c3c",
  base02 = "#7d8785",
  base03 = "#7d8785",
  base04 = "#c5d2d0",
  base05 = "#f8fffe",
  base06 = "#f8fffe",
  base07 = "#f8fffe",
  base08 = "#ffc09f",
  base09 = "#ffc09f",
  base0A = "#99dcd2",
  base0B = "#9cf0a1",
  base0C = "#d6fff9",
  base0D = "#99dcd2",
  base0E = "#bffff6",
  base0F = "#bffff6",
}

local dank_highlights = {
  Visual = { bg = "#7d8785", fg = "#f8fffe", bold = true },
  Statusline = { bg = "#99dcd2", fg = "#292c3c" },
  LineNr = { fg = "#7d8785" },
  CursorLineNr = { fg = "#d6fff9", bold = true },
  Statement = { fg = "#bffff6", bold = true },
  Keyword = { link = "Statement" },
  Repeat = { link = "Statement" },
  Conditional = { link = "Statement" },
  Function = { fg = "#99dcd2", bold = true },
  Macro = { fg = "#99dcd2", italic = true },
  ["@function.macro"] = { link = "Macro" },
  Type = { fg = "#d6fff9", bold = true, italic = true },
  Structure = { link = "Type" },
  String = { fg = "#9cf0a1", italic = true },
  Operator = { fg = "#c5d2d0" },
  Delimiter = { fg = "#c5d2d0" },
  ["@punctuation.bracket"] = { link = "Delimiter" },
  ["@punctuation.delimiter"] = { link = "Delimiter" },
  Comment = { fg = "#7d8785", italic = true },
}

-- Themes that need more than a plain `:colorscheme <name>` to load.
local loaders = {
  oxocarbon = function()
    vim.o.background = "dark"
    vim.cmd.colorscheme("oxocarbon")
  end,
  zitchdog = function()
    vim.cmd.colorscheme("zitchdog-grape")
    -- zitchdog sets colors_name before it clears highlights, which wipes it again
    vim.g.colors_name = "zitchdog-grape"
  end,
  dankcolors = function()
    require("base16-colorscheme").setup(dank_palette)
    for group, hl in pairs(dank_highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
    vim.g.colors_name = "dankcolors"
  end,
}

local function apply(name)
  local load = loaders[name]
  if load then
    load()
  else
    vim.cmd.colorscheme(name)
  end
end

local function complete(prefix)
  local seen = {}
  local names = {}
  for _, name in ipairs(vim.list_extend(vim.tbl_keys(loaders), vim.fn.getcompletion("", "color"))) do
    if not seen[name] and name:find(prefix, 1, true) == 1 then
      seen[name] = true
      table.insert(names, name)
    end
  end
  table.sort(names)
  return names
end

local function watch_for_reload()
  if _G._theme_watcher then
    return
  end
  -- Watch the directory rather than the file so rename-style saves don't break the watcher.
  local dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local uv = vim.uv or vim.loop
  _G._theme_watcher = uv.new_fs_event()
  _G._theme_watcher:start(
    dir,
    {},
    vim.schedule_wrap(function(_, filename)
      if filename ~= "theme.lua" then
        return
      end
      local ok, spec = pcall(dofile, dir .. "/theme.lua")
      if not ok then
        return
      end
      for _, plugin in ipairs(spec) do
        if plugin[1] == "LazyVim/LazyVim" and type(plugin.opts.colorscheme) == "function" then
          plugin.opts.colorscheme()
          vim.notify("Theme reloaded", vim.log.levels.INFO, { title = "theme.lua" })
        end
      end
    end)
  )
end

return {
  -- Colorscheme plugins. All lazy: lazy.nvim loads them on `:colorscheme` / `require`.
  { "nyoom-engineering/oxocarbon.nvim", build = false },
  { "theamallalgi/zitchdog", dependencies = { "folke/snacks.nvim" }, opts = { variant = "grape" } },
  { "RRethy/base16-nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        apply(colorscheme)
      end,
    },
    init = function()
      vim.api.nvim_create_user_command("Theme", function(cmd)
        apply(cmd.args)
      end, { nargs = 1, complete = complete, desc = "Switch colorscheme" })
      watch_for_reload()
    end,
  },
}
