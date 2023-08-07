local M = {}

local function adjust_color(color, option)
    -- Extract the RGB values from the color
    local r, g, b = color:match('#(%x%x)(%x%x)(%x%x)')
    local factor = 15

    -- Convert the RGB values from hexadecimal to decimal
    r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

    -- Apply the brightness factor to each RGB value
  if option == "bright" then
    r = math.min(r + factor, 255)
    g = math.min(g + factor, 255)
    b = math.min(b + factor, 255)
  elseif option == "dark" then
    r = math.min(r - factor, 255)
    g = math.min(g - factor, 255)
    b = math.min(b - factor, 255)
  else
    print("if statement to check option doesnt work")
  end
    -- Convert the RGB values back to hexadecimal and return the new color
    return string.format('#%02x%02x%02x', r, g, b)
end

function M.get_colors()
  vim.cmd [[ source $HOME/.cache/wal/colors-wal.vim ]]

  return {
    background = vim.g.background,
    foreground = vim.g.foreground,
    cursor = vim.g.cursor,
    normal0 = vim.g.color1,
    normal1 = vim.g.color2,
    normal2 = vim.g.color3,
    normal3 = vim.g.color4,
    normal4 = vim.g.color5,
    normal5 = vim.g.color6,
    normal6 = vim.g.color7,
    normal7 = vim.g.color8,
    dark0 = adjust_color(vim.g.color1, "dark"),
    dark1 = adjust_color(vim.g.color2, "dark"),
    dark2 = adjust_color(vim.g.color3, "dark"),
    dark3 = adjust_color(vim.g.color4, "dark"),
    dark4 = adjust_color(vim.g.color5, "dark"),
    dark5 = adjust_color(vim.g.color6, "dark"),
    dark6 = adjust_color(vim.g.color7, "dark"),
    dark7 = adjust_color(vim.g.color8, "dark"),
    bright0 = adjust_color(vim.g.color1, "bright"),
    bright1 = adjust_color(vim.g.color2, "bright"),
    bright2 = adjust_color(vim.g.color3, "bright"),
    bright3 = adjust_color(vim.g.color4, "bright"),
    bright4 = adjust_color(vim.g.color5, "bright"),
    bright5 = adjust_color(vim.g.color6, "bright"),
    bright6 = adjust_color(vim.g.color7, "bright"),
    bright7 = adjust_color(vim.g.color8, "bright"),
  }
end

return M

