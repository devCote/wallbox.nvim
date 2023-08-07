# WALLBOX 
### awesome theme for nvim using pywal colors
![1ex](https://github.com/devCote/wallbox.nvim/assets/32065068/a36d41c1-e890-4299-aa61-4867c1cc181c)
![2ex](https://github.com/devCote/wallbox.nvim/assets/32065068/97146214-3d94-403d-8d03-e2f4964e38f2)

# Prerequisites

Neovim 0.8.0+

Pywal

# Installing

Using `packer`

```lua
use { "devCote/wallbox.nvim" }
```

Using `lazy.nvim`

```lua
{ "devCote/wallbox.nvim" }
```

# Basic Usage

Inside `init.vim`

```vim
colorscheme wallbox
" optional
vim.o.background = "dark" " or "light" for light mode
```
Inside `init.lua`

```lua
vim.cmd([[colorscheme wallbox]])
-- optional
vim.o.background = "dark" -- or "light" for light mode
```


# Configurations

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
