-- wallbox palette
local M = {}

local wal_colors = require("wallbox.colorizer").get_colors()

M.colors = {
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
  bright_red = wal_colors.bright0,
  bright_green = wal_colors.bright1,
  bright_yellow = wal_colors.bright2,
  bright_blue = wal_colors.bright3,
  bright_purple = wal_colors.bright4,
  bright_aqua = wal_colors.bright5,
  bright_orange = wal_colors.bright6,
  neutral_red = wal_colors.normal0,
  neutral_green = wal_colors.normal1,
  neutral_yellow = wal_colors.normal2,
  neutral_blue = wal_colors.normal3,
  neutral_purple = wal_colors.normal4,
  neutral_aqua = wal_colors.normal5,
  neutral_orange = wal_colors.normal6,
  faded_red = wal_colors.dark0,
  faded_green = wal_colors.dark1,
  faded_yellow = wal_colors.dark2,
  faded_blue = wal_colors.dark3,
  faded_purple = wal_colors.dark4,
  faded_aqua = wal_colors.dark5,
  faded_orange = wal_colors.dark6,
  gray = "#928374",
}

M.get_base_colors = function(bg, contrast)
  local config = require("wallbox").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark2,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light0,
      fg1 = p.light1,
      fg2 = p.light2,
      fg3 = p.light3,
      fg4 = p.light4,
      red = p.bright_red,
      green = p.bright_green,
      yellow = p.bright_yellow,
      blue = p.bright_blue,
      purple = p.bright_purple,
      aqua = p.bright_aqua,
      orange = p.bright_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
