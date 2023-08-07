# WALLBOX - awesome theme for nvim using pywal colors

!example1_image (https://github.com/devCote/wallbox.nvim/example/1ex.png?raw=true)
!example2_image (https://github.com/devCote/wallbox.nvim/example/2ex.png?raw=true)

# Prerequisites

Neovim 0.8.0+

# Installing

Using `packer`

```lua
use { "devCote/wallbox.nvim" }
```

Using `lazy.nvim`

```lua
{ "devCote/wallbox.nvim", priority = 1000 }
```

# Basic Usage

Inside `init.vim`

```vim
set background=dark " or light if you want light mode
colorscheme wallbox
```

Inside `init.lua`

```lua
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme wallbox]])
```

# Configuration

Additional settings for wallbox are:

```lua
-- setup must be called before loading the colorscheme
-- Default options:
require("wallbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme wallbox")
```

## Overriding

### Palette

You can specify your own palette colors. For example:

```lua
require("wallbox").setup({
    palette_overrides = {
        bright_green = "#990000",
    }
})
vim.cmd("colorscheme wallbox")
```

More colors in the [palette.lua](lua/wallbox/palette.lua) file

### Highlight groups

If you don't enjoy the current color for a specific highlight group, now you can just override it in the setup. For
example:

```lua
require("wallbox").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd("colorscheme wallbox")
```

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in `:h synIDattr`
