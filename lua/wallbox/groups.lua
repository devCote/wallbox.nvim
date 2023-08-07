local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("wallbox").config
  local colors = require("wallbox.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    wallboxFg0 = { fg = colors.fg0 },
    wallboxFg1 = { fg = colors.fg1 },
    wallboxFg2 = { fg = colors.fg2 },
    wallboxFg3 = { fg = colors.fg3 },
    wallboxFg4 = { fg = colors.fg4 },
    wallboxGray = { fg = colors.gray },
    wallboxBg0 = { fg = colors.bg0 },
    wallboxBg1 = { fg = colors.bg1 },
    wallboxBg2 = { fg = colors.bg2 },
    wallboxBg3 = { fg = colors.bg3 },
    wallboxBg4 = { fg = colors.bg4 },
    wallboxRed = { fg = colors.red },
    wallboxRedBold = { fg = colors.red, bold = config.bold },
    wallboxGreen = { fg = colors.green },
    wallboxGreenBold = { fg = colors.green, bold = config.bold },
    wallboxYellow = { fg = colors.yellow },
    wallboxYellowBold = { fg = colors.yellow, bold = config.bold },
    wallboxBlue = { fg = colors.blue },
    wallboxBlueBold = { fg = colors.blue, bold = config.bold },
    wallboxPurple = { fg = colors.purple },
    wallboxPurpleBold = { fg = colors.purple, bold = config.bold },
    wallboxAqua = { fg = colors.aqua },
    wallboxAquaBold = { fg = colors.aqua, bold = config.bold },
    wallboxOrange = { fg = colors.orange },
    wallboxOrangeBold = { fg = colors.orange, bold = config.bold },
    wallboxRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    wallboxGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    wallboxYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    wallboxBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    wallboxPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    wallboxAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    wallboxOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    wallboxRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    wallboxGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    wallboxYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    wallboxBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    wallboxPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    wallboxAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    wallboxOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "wallboxBg2" },
    SpecialKey = { link = "wallboxFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "wallboxBlueBold" },
    Title = { link = "wallboxGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "wallboxYellowBold" },
    ModeMsg = { link = "wallboxYellowBold" },
    Question = { link = "wallboxOrangeBold" },
    WarningMsg = { link = "wallboxRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "wallboxOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "wallboxRed" },
    Conditional = { link = "wallboxRed" },
    Repeat = { link = "wallboxRed" },
    Label = { link = "wallboxRed" },
    Exception = { link = "wallboxRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "wallboxRed" },
    Identifier = { link = "wallboxBlue" },
    Function = { link = "wallboxGreenBold" },
    PreProc = { link = "wallboxAqua" },
    Include = { link = "wallboxAqua" },
    Define = { link = "wallboxAqua" },
    Macro = { link = "wallboxAqua" },
    PreCondit = { link = "wallboxAqua" },
    Constant = { link = "wallboxPurple" },
    Character = { link = "wallboxPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "wallboxPurple" },
    Number = { link = "wallboxPurple" },
    Float = { link = "wallboxPurple" },
    Type = { link = "wallboxYellow" },
    StorageClass = { link = "wallboxOrange" },
    Structure = { link = "wallboxAqua" },
    Typedef = { link = "wallboxYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "wallboxBlueUnderline" },
    SpellBad = { link = "wallboxRedUnderline" },
    SpellLocal = { link = "wallboxAquaUnderline" },
    SpellRare = { link = "wallboxPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "wallboxRed" },
    DiagnosticSignError = { link = "wallboxRedSign" },
    DiagnosticUnderlineError = { link = "wallboxRedUnderline" },
    DiagnosticWarn = { link = "wallboxYellow" },
    DiagnosticSignWarn = { link = "wallboxYellowSign" },
    DiagnosticUnderlineWarn = { link = "wallboxYellowUnderline" },
    DiagnosticInfo = { link = "wallboxBlue" },
    DiagnosticSignInfo = { link = "wallboxBlueSign" },
    DiagnosticUnderlineInfo = { link = "wallboxBlueUnderline" },
    DiagnosticHint = { link = "wallboxAqua" },
    DiagnosticSignHint = { link = "wallboxAquaSign" },
    DiagnosticUnderlineHint = { link = "wallboxAquaUnderline" },
    DiagnosticFloatingError = { link = "wallboxRed" },
    DiagnosticFloatingWarn = { link = "wallboxOrange" },
    DiagnosticFloatingInfo = { link = "wallboxBlue" },
    DiagnosticFloatingHint = { link = "wallboxAqua" },
    DiagnosticVirtualTextError = { link = "wallboxRed" },
    DiagnosticVirtualTextWarn = { link = "wallboxYellow" },
    DiagnosticVirtualTextInfo = { link = "wallboxBlue" },
    DiagnosticVirtualTextHint = { link = "wallboxAqua" },
    LspReferenceRead = { link = "wallboxYellowBold" },
    LspReferenceText = { link = "wallboxYellowBold" },
    LspReferenceWrite = { link = "wallboxOrangeBold" },
    LspCodeLens = { link = "wallboxGray" },
    LspSignatureActiveParameter = { link = "Search" },

    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },

    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },

    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },

    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },

    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },

    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },

    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },

    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },

    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "wallboxRed" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },

    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },

    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },

    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },

    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "wallboxFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "wallboxFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "wallboxFg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },

    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.note.comment     ; XXX in comments
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },

    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },

    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },

    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },

    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = {}, -- do not overwrite comments
    ["@lsp.type.decorator"] = { link = "@macro" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@constructor" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- gitcommit
    gitcommitSelectedFile = { link = "wallboxGreen" },
    gitcommitDiscardedFile = { link = "wallboxRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "wallboxGreenSign" },
    GitSignsChange = { link = "wallboxAquaSign" },
    GitSignsDelete = { link = "wallboxRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "wallboxRedSign" },
    -- vim-startify
    StartifyBracket = { link = "wallboxFg3" },
    StartifyFile = { link = "wallboxFg1" },
    StartifyNumber = { link = "wallboxBlue" },
    StartifyPath = { link = "wallboxGray" },
    StartifySlash = { link = "wallboxGray" },
    StartifySection = { link = "wallboxYellow" },
    StartifySpecial = { link = "wallboxBg2" },
    StartifyHeader = { link = "wallboxOrange" },
    StartifyFooter = { link = "wallboxBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "wallboxAqua" },
    DirvishArg = { link = "wallboxYellow" },
    -- netrw
    netrwDir = { link = "wallboxAqua" },
    netrwClassify = { link = "wallboxAqua" },
    netrwLink = { link = "wallboxGray" },
    netrwSymLink = { link = "wallboxFg1" },
    netrwExe = { link = "wallboxYellow" },
    netrwComment = { link = "wallboxGray" },
    netrwList = { link = "wallboxBlue" },
    netrwHelpCmd = { link = "wallboxAqua" },
    netrwCmdSep = { link = "wallboxFg3" },
    netrwVersion = { link = "wallboxGreen" },
    -- nerdtree
    NERDTreeDir = { link = "wallboxAqua" },
    NERDTreeDirSlash = { link = "wallboxAqua" },
    NERDTreeOpenable = { link = "wallboxOrange" },
    NERDTreeClosable = { link = "wallboxOrange" },
    NERDTreeFile = { link = "wallboxFg1" },
    NERDTreeExecFile = { link = "wallboxYellow" },
    NERDTreeUp = { link = "wallboxGray" },
    NERDTreeCWD = { link = "wallboxGreen" },
    NERDTreeHelp = { link = "wallboxFg1" },
    NERDTreeToggleOn = { link = "wallboxGreen" },
    NERDTreeToggleOff = { link = "wallboxRed" },
    -- coc.nvim
    CocErrorSign = { link = "wallboxRedSign" },
    CocWarningSign = { link = "wallboxOrangeSign" },
    CocInfoSign = { link = "wallboxBlueSign" },
    CocHintSign = { link = "wallboxAquaSign" },
    CocErrorFloat = { link = "wallboxRed" },
    CocWarningFloat = { link = "wallboxOrange" },
    CocInfoFloat = { link = "wallboxBlue" },
    CocHintFloat = { link = "wallboxAqua" },
    CocDiagnosticsError = { link = "wallboxRed" },
    CocDiagnosticsWarning = { link = "wallboxOrange" },
    CocDiagnosticsInfo = { link = "wallboxBlue" },
    CocDiagnosticsHint = { link = "wallboxAqua" },
    CocSelectedText = { link = "wallboxRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "wallboxGray" },
    CocErrorHighlight = { link = "wallboxRedUnderline" },
    CocWarningHighlight = { link = "wallboxOrangeUnderline" },
    CocInfoHighlight = { link = "wallboxBlueUnderline" },
    CocHintHighlight = { link = "wallboxAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "wallboxFg1" },
    TelescopeSelection = { link = "wallboxOrangeBold" },
    TelescopeSelectionCaret = { link = "wallboxRed" },
    TelescopeMultiSelection = { link = "wallboxGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "wallboxBlue" },
    TelescopePromptPrefix = { link = "wallboxRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "wallboxFg0" },
    CmpItemAbbrDeprecated = { link = "wallboxFg1" },
    CmpItemAbbrMatch = { link = "wallboxBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "wallboxBlueUnderline" },
    CmpItemMenu = { link = "wallboxGray" },
    CmpItemKindText = { link = "wallboxOrange" },
    CmpItemKindVariable = { link = "wallboxOrange" },
    CmpItemKindMethod = { link = "wallboxBlue" },
    CmpItemKindFunction = { link = "wallboxBlue" },
    CmpItemKindConstructor = { link = "wallboxYellow" },
    CmpItemKindUnit = { link = "wallboxBlue" },
    CmpItemKindField = { link = "wallboxBlue" },
    CmpItemKindClass = { link = "wallboxYellow" },
    CmpItemKindInterface = { link = "wallboxYellow" },
    CmpItemKindModule = { link = "wallboxBlue" },
    CmpItemKindProperty = { link = "wallboxBlue" },
    CmpItemKindValue = { link = "wallboxOrange" },
    CmpItemKindEnum = { link = "wallboxYellow" },
    CmpItemKindOperator = { link = "wallboxYellow" },
    CmpItemKindKeyword = { link = "wallboxPurple" },
    CmpItemKindEvent = { link = "wallboxPurple" },
    CmpItemKindReference = { link = "wallboxPurple" },
    CmpItemKindColor = { link = "wallboxPurple" },
    CmpItemKindSnippet = { link = "wallboxGreen" },
    CmpItemKindFile = { link = "wallboxBlue" },
    CmpItemKindFolder = { link = "wallboxBlue" },
    CmpItemKindEnumMember = { link = "wallboxAqua" },
    CmpItemKindConstant = { link = "wallboxOrange" },
    CmpItemKindStruct = { link = "wallboxYellow" },
    CmpItemKindTypeParameter = { link = "wallboxYellow" },
    diffAdded = { link = "wallboxGreen" },
    diffRemoved = { link = "wallboxRed" },
    diffChanged = { link = "wallboxAqua" },
    diffFile = { link = "wallboxOrange" },
    diffNewFile = { link = "wallboxYellow" },
    diffOldFile = { link = "wallboxOrange" },
    diffLine = { link = "wallboxBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "wallboxBlue" },
    NavicIconsModule = { link = "wallboxOrange" },
    NavicIconsNamespace = { link = "wallboxBlue" },
    NavicIconsPackage = { link = "wallboxAqua" },
    NavicIconsClass = { link = "wallboxYellow" },
    NavicIconsMethod = { link = "wallboxBlue" },
    NavicIconsProperty = { link = "wallboxAqua" },
    NavicIconsField = { link = "wallboxPurple" },
    NavicIconsConstructor = { link = "wallboxBlue" },
    NavicIconsEnum = { link = "wallboxPurple" },
    NavicIconsInterface = { link = "wallboxGreen" },
    NavicIconsFunction = { link = "wallboxBlue" },
    NavicIconsVariable = { link = "wallboxPurple" },
    NavicIconsConstant = { link = "wallboxOrange" },
    NavicIconsString = { link = "wallboxGreen" },
    NavicIconsNumber = { link = "wallboxOrange" },
    NavicIconsBoolean = { link = "wallboxOrange" },
    NavicIconsArray = { link = "wallboxOrange" },
    NavicIconsObject = { link = "wallboxOrange" },
    NavicIconsKey = { link = "wallboxAqua" },
    NavicIconsNull = { link = "wallboxOrange" },
    NavicIconsEnumMember = { link = "wallboxYellow" },
    NavicIconsStruct = { link = "wallboxPurple" },
    NavicIconsEvent = { link = "wallboxYellow" },
    NavicIconsOperator = { link = "wallboxRed" },
    NavicIconsTypeParameter = { link = "wallboxRed" },
    NavicText = { link = "wallboxWhite" },
    NavicSeparator = { link = "wallboxWhite" },
    -- html
    htmlTag = { link = "wallboxAquaBold" },
    htmlEndTag = { link = "wallboxAquaBold" },
    htmlTagName = { link = "wallboxBlue" },
    htmlArg = { link = "wallboxOrange" },
    htmlTagN = { link = "wallboxFg1" },
    htmlSpecialTagName = { link = "wallboxBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "wallboxRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "wallboxAquaBold" },
    xmlEndTag = { link = "wallboxAquaBold" },
    xmlTagName = { link = "wallboxBlue" },
    xmlEqual = { link = "wallboxBlue" },
    docbkKeyword = { link = "wallboxAquaBold" },
    xmlDocTypeDecl = { link = "wallboxGray" },
    xmlDocTypeKeyword = { link = "wallboxPurple" },
    xmlCdataStart = { link = "wallboxGray" },
    xmlCdataCdata = { link = "wallboxPurple" },
    dtdFunction = { link = "wallboxGray" },
    dtdTagName = { link = "wallboxPurple" },
    xmlAttrib = { link = "wallboxOrange" },
    xmlProcessingDelim = { link = "wallboxGray" },
    dtdParamEntityPunct = { link = "wallboxGray" },
    dtdParamEntityDPunct = { link = "wallboxGray" },
    xmlAttribPunct = { link = "wallboxGray" },
    xmlEntity = { link = "wallboxRed" },
    xmlEntityPunct = { link = "wallboxRed" },
    -- clojure
    clojureKeyword = { link = "wallboxBlue" },
    clojureCond = { link = "wallboxOrange" },
    clojureSpecial = { link = "wallboxOrange" },
    clojureDefine = { link = "wallboxOrange" },
    clojureFunc = { link = "wallboxYellow" },
    clojureRepeat = { link = "wallboxYellow" },
    clojureCharacter = { link = "wallboxAqua" },
    clojureStringEscape = { link = "wallboxAqua" },
    clojureException = { link = "wallboxRed" },
    clojureRegexp = { link = "wallboxAqua" },
    clojureRegexpEscape = { link = "wallboxAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "wallboxFg3" },
    clojureAnonArg = { link = "wallboxYellow" },
    clojureVariable = { link = "wallboxBlue" },
    clojureMacro = { link = "wallboxOrange" },
    clojureMeta = { link = "wallboxYellow" },
    clojureDeref = { link = "wallboxYellow" },
    clojureQuote = { link = "wallboxYellow" },
    clojureUnquote = { link = "wallboxYellow" },
    -- C
    cOperator = { link = "wallboxPurple" },
    cppOperator = { link = "wallboxPurple" },
    cStructure = { link = "wallboxOrange" },
    -- python
    pythonBuiltin = { link = "wallboxOrange" },
    pythonBuiltinObj = { link = "wallboxOrange" },
    pythonBuiltinFunc = { link = "wallboxOrange" },
    pythonFunction = { link = "wallboxAqua" },
    pythonDecorator = { link = "wallboxRed" },
    pythonInclude = { link = "wallboxBlue" },
    pythonImport = { link = "wallboxBlue" },
    pythonRun = { link = "wallboxBlue" },
    pythonCoding = { link = "wallboxBlue" },
    pythonOperator = { link = "wallboxRed" },
    pythonException = { link = "wallboxRed" },
    pythonExceptions = { link = "wallboxPurple" },
    pythonBoolean = { link = "wallboxPurple" },
    pythonDot = { link = "wallboxFg3" },
    pythonConditional = { link = "wallboxRed" },
    pythonRepeat = { link = "wallboxRed" },
    pythonDottedName = { link = "wallboxGreenBold" },
    -- CSS
    cssBraces = { link = "wallboxBlue" },
    cssFunctionName = { link = "wallboxYellow" },
    cssIdentifier = { link = "wallboxOrange" },
    cssClassName = { link = "wallboxGreen" },
    cssColor = { link = "wallboxBlue" },
    cssSelectorOp = { link = "wallboxBlue" },
    cssSelectorOp2 = { link = "wallboxBlue" },
    cssImportant = { link = "wallboxGreen" },
    cssVendor = { link = "wallboxFg1" },
    cssTextProp = { link = "wallboxAqua" },
    cssAnimationProp = { link = "wallboxAqua" },
    cssUIProp = { link = "wallboxYellow" },
    cssTransformProp = { link = "wallboxAqua" },
    cssTransitionProp = { link = "wallboxAqua" },
    cssPrintProp = { link = "wallboxAqua" },
    cssPositioningProp = { link = "wallboxYellow" },
    cssBoxProp = { link = "wallboxAqua" },
    cssFontDescriptorProp = { link = "wallboxAqua" },
    cssFlexibleBoxProp = { link = "wallboxAqua" },
    cssBorderOutlineProp = { link = "wallboxAqua" },
    cssBackgroundProp = { link = "wallboxAqua" },
    cssMarginProp = { link = "wallboxAqua" },
    cssListProp = { link = "wallboxAqua" },
    cssTableProp = { link = "wallboxAqua" },
    cssFontProp = { link = "wallboxAqua" },
    cssPaddingProp = { link = "wallboxAqua" },
    cssDimensionProp = { link = "wallboxAqua" },
    cssRenderProp = { link = "wallboxAqua" },
    cssColorProp = { link = "wallboxAqua" },
    cssGeneratedContentProp = { link = "wallboxAqua" },
    -- javascript
    javaScriptBraces = { link = "wallboxFg1" },
    javaScriptFunction = { link = "wallboxAqua" },
    javaScriptIdentifier = { link = "wallboxRed" },
    javaScriptMember = { link = "wallboxBlue" },
    javaScriptNumber = { link = "wallboxPurple" },
    javaScriptNull = { link = "wallboxPurple" },
    javaScriptParens = { link = "wallboxFg3" },
    -- typescript
    typescriptReserved = { link = "wallboxAqua" },
    typescriptLabel = { link = "wallboxAqua" },
    typescriptFuncKeyword = { link = "wallboxAqua" },
    typescriptIdentifier = { link = "wallboxOrange" },
    typescriptBraces = { link = "wallboxFg1" },
    typescriptEndColons = { link = "wallboxFg1" },
    typescriptDOMObjects = { link = "wallboxFg1" },
    typescriptAjaxMethods = { link = "wallboxFg1" },
    typescriptLogicSymbols = { link = "wallboxFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "wallboxFg1" },
    typescriptParens = { link = "wallboxFg3" },
    typescriptOpSymbols = { link = "wallboxFg3" },
    typescriptHtmlElemProperties = { link = "wallboxFg1" },
    typescriptNull = { link = "wallboxPurple" },
    typescriptInterpolationDelimiter = { link = "wallboxAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "wallboxAqua" },
    purescriptModuleName = { link = "wallboxFg1" },
    purescriptWhere = { link = "wallboxAqua" },
    purescriptDelimiter = { link = "wallboxFg4" },
    purescriptType = { link = "wallboxFg1" },
    purescriptImportKeyword = { link = "wallboxAqua" },
    purescriptHidingKeyword = { link = "wallboxAqua" },
    purescriptAsKeyword = { link = "wallboxAqua" },
    purescriptStructure = { link = "wallboxAqua" },
    purescriptOperator = { link = "wallboxBlue" },
    purescriptTypeVar = { link = "wallboxFg1" },
    purescriptConstructor = { link = "wallboxFg1" },
    purescriptFunction = { link = "wallboxFg1" },
    purescriptConditional = { link = "wallboxOrange" },
    purescriptBacktick = { link = "wallboxOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "wallboxFg3" },
    coffeeSpecialOp = { link = "wallboxFg3" },
    coffeeCurly = { link = "wallboxOrange" },
    coffeeParen = { link = "wallboxFg3" },
    coffeeBracket = { link = "wallboxOrange" },
    -- ruby
    rubyStringDelimiter = { link = "wallboxGreen" },
    rubyInterpolationDelimiter = { link = "wallboxAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "wallboxRed" },
    objcDirective = { link = "wallboxBlue" },
    -- go
    goDirective = { link = "wallboxAqua" },
    goConstants = { link = "wallboxPurple" },
    goDeclaration = { link = "wallboxRed" },
    goDeclType = { link = "wallboxBlue" },
    goBuiltins = { link = "wallboxOrange" },
    -- lua
    luaIn = { link = "wallboxRed" },
    luaFunction = { link = "wallboxAqua" },
    luaTable = { link = "wallboxOrange" },
    -- moonscript
    moonSpecialOp = { link = "wallboxFg3" },
    moonExtendedOp = { link = "wallboxFg3" },
    moonFunction = { link = "wallboxFg3" },
    moonObject = { link = "wallboxYellow" },
    -- java
    javaAnnotation = { link = "wallboxBlue" },
    javaDocTags = { link = "wallboxAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "wallboxFg3" },
    javaParen1 = { link = "wallboxFg3" },
    javaParen2 = { link = "wallboxFg3" },
    javaParen3 = { link = "wallboxFg3" },
    javaParen4 = { link = "wallboxFg3" },
    javaParen5 = { link = "wallboxFg3" },
    javaOperator = { link = "wallboxOrange" },
    javaVarArg = { link = "wallboxGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "wallboxGreen" },
    elixirInterpolationDelimiter = { link = "wallboxAqua" },
    elixirModuleDeclaration = { link = "wallboxYellow" },
    -- scala
    scalaNameDefinition = { link = "wallboxFg1" },
    scalaCaseFollowing = { link = "wallboxFg1" },
    scalaCapitalWord = { link = "wallboxFg1" },
    scalaTypeExtension = { link = "wallboxFg1" },
    scalaKeyword = { link = "wallboxRed" },
    scalaKeywordModifier = { link = "wallboxRed" },
    scalaSpecial = { link = "wallboxAqua" },
    scalaOperator = { link = "wallboxFg1" },
    scalaTypeDeclaration = { link = "wallboxYellow" },
    scalaTypeTypePostDeclaration = { link = "wallboxYellow" },
    scalaInstanceDeclaration = { link = "wallboxFg1" },
    scalaInterpolation = { link = "wallboxAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "wallboxGreenBold" },
    markdownH2 = { link = "wallboxGreenBold" },
    markdownH3 = { link = "wallboxYellowBold" },
    markdownH4 = { link = "wallboxYellowBold" },
    markdownH5 = { link = "wallboxYellow" },
    markdownH6 = { link = "wallboxYellow" },
    markdownCode = { link = "wallboxAqua" },
    markdownCodeBlock = { link = "wallboxAqua" },
    markdownCodeDelimiter = { link = "wallboxAqua" },
    markdownBlockquote = { link = "wallboxGray" },
    markdownListMarker = { link = "wallboxGray" },
    markdownOrderedListMarker = { link = "wallboxGray" },
    markdownRule = { link = "wallboxGray" },
    markdownHeadingRule = { link = "wallboxGray" },
    markdownUrlDelimiter = { link = "wallboxFg3" },
    markdownLinkDelimiter = { link = "wallboxFg3" },
    markdownLinkTextDelimiter = { link = "wallboxFg3" },
    markdownHeadingDelimiter = { link = "wallboxOrange" },
    markdownUrl = { link = "wallboxPurple" },
    markdownUrlTitleDelimiter = { link = "wallboxGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "wallboxBlue" },
    haskellIdentifier = { link = "wallboxAqua" },
    haskellSeparator = { link = "wallboxFg4" },
    haskellDelimiter = { link = "wallboxOrange" },
    haskellOperators = { link = "wallboxPurple" },
    haskellBacktick = { link = "wallboxOrange" },
    haskellStatement = { link = "wallboxPurple" },
    haskellConditional = { link = "wallboxPurple" },
    haskellLet = { link = "wallboxRed" },
    haskellDefault = { link = "wallboxRed" },
    haskellWhere = { link = "wallboxRed" },
    haskellBottom = { link = "wallboxRedBold" },
    haskellImportKeywords = { link = "wallboxPurpleBold" },
    haskellDeclKeyword = { link = "wallboxOrange" },
    haskellDecl = { link = "wallboxOrange" },
    haskellDeriving = { link = "wallboxPurple" },
    haskellAssocType = { link = "wallboxAqua" },
    haskellNumber = { link = "wallboxAqua" },
    haskellPragma = { link = "wallboxRedBold" },
    haskellTH = { link = "wallboxAquaBold" },
    haskellForeignKeywords = { link = "wallboxGreen" },
    haskellKeyword = { link = "wallboxRed" },
    haskellFloat = { link = "wallboxAqua" },
    haskellInfix = { link = "wallboxPurple" },
    haskellQuote = { link = "wallboxGreenBold" },
    haskellShebang = { link = "wallboxYellowBold" },
    haskellLiquid = { link = "wallboxPurpleBold" },
    haskellQuasiQuoted = { link = "wallboxBlueBold" },
    haskellRecursiveDo = { link = "wallboxPurple" },
    haskellQuotedType = { link = "wallboxRed" },
    haskellPreProc = { link = "wallboxFg4" },
    haskellTypeRoles = { link = "wallboxRedBold" },
    haskellTypeForall = { link = "wallboxRed" },
    haskellPatternKeyword = { link = "wallboxBlue" },
    -- json
    jsonKeyword = { link = "wallboxGreen" },
    jsonQuote = { link = "wallboxGreen" },
    jsonBraces = { link = "wallboxFg1" },
    jsonString = { link = "wallboxFg1" },
    -- mail
    mailQuoted1 = { link = "wallboxAqua" },
    mailQuoted2 = { link = "wallboxPurple" },
    mailQuoted3 = { link = "wallboxYellow" },
    mailQuoted4 = { link = "wallboxGreen" },
    mailQuoted5 = { link = "wallboxRed" },
    mailQuoted6 = { link = "wallboxOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "wallboxFg1" },
    csEndColon = { link = "wallboxFg1" },
    csLogicSymbols = { link = "wallboxFg1" },
    csParens = { link = "wallboxFg3" },
    csOpSymbols = { link = "wallboxFg3" },
    csInterpolationDelimiter = { link = "wallboxFg3" },
    csInterpolationAlignDel = { link = "wallboxAquaBold" },
    csInterpolationFormat = { link = "wallboxAqua" },
    csInterpolationFormatDel = { link = "wallboxAquaBold" },
    -- rust btw
    rustSigil = { link = "wallboxOrange" },
    rustEscape = { link = "wallboxAqua" },
    rustStringContinuation = { link = "wallboxAqua" },
    rustEnum = { link = "wallboxAqua" },
    rustStructure = { link = "wallboxAqua" },
    rustModPathSep = { link = "wallboxFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "wallboxAqua" },
    -- ocaml
    ocamlOperator = { link = "wallboxFg1" },
    ocamlKeyChar = { link = "wallboxOrange" },
    ocamlArrow = { link = "wallboxOrange" },
    ocamlInfixOpKeyword = { link = "wallboxRed" },
    ocamlConstructor = { link = "wallboxOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "wallboxFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "wallboxFg1" },
    LspSagaAutoPreview = { link = "wallboxOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "wallboxAqua" },
    LspSagaDefPreviewBorder = { link = "wallboxBlue" },
    LspSagaHoverBorder = { link = "wallboxOrange" },
    LspSagaRenameBorder = { link = "wallboxBlue" },
    LspSagaDiagnosticSource = { link = "wallboxOrange" },
    LspSagaDiagnosticBorder = { link = "wallboxPurple" },
    LspSagaDiagnosticHeader = { link = "wallboxGreen" },
    LspSagaSignatureHelpBorder = { link = "wallboxGreen" },
    SagaShadow = { link = "wallboxBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "wallboxOrange" },
    DashboardHeader = { link = "wallboxAqua" },
    DashboardCenter = { link = "wallboxYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "wallboxAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "wallboxFg1" },
    CarbonExe = { link = "wallboxYellow" },
    CarbonSymlink = { link = "wallboxAqua" },
    CarbonBrokenSymlink = { link = "wallboxRed" },
    CarbonIndicator = { link = "wallboxGray" },
    CarbonDanger = { link = "wallboxRed" },
    CarbonPending = { link = "wallboxYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "wallboxBlue" },
    NotifyDEBUGIcon = { link = "wallboxBlue" },
    NotifyDEBUGTitle = { link = "wallboxBlue" },
    NotifyERRORBorder = { link = "wallboxRed" },
    NotifyERRORIcon = { link = "wallboxRed" },
    NotifyERRORTitle = { link = "wallboxRed" },
    NotifyINFOBorder = { link = "wallboxAqua" },
    NotifyINFOIcon = { link = "wallboxAqua" },
    NotifyINFOTitle = { link = "wallboxAqua" },
    NotifyTRACEBorder = { link = "wallboxGreen" },
    NotifyTRACEIcon = { link = "wallboxGreen" },
    NotifyTRACETitle = { link = "wallboxGreen" },
    NotifyWARNBorder = { link = "wallboxYellow" },
    NotifyWARNIcon = { link = "wallboxYellow" },
    NotifyWARNTitle = { link = "wallboxYellow" },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
