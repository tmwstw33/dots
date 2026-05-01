local lush = require("lush")
local hsl = lush.hsl

--@diagnostic disable: undefined-global
return lush(function(injected)
  local sym = injected.sym

  local bg        = hsl("#111317")
  local bg_alt    = bg.lighten(5)
  local fg        = hsl("#d4d7dc")
  local fg_dim    = fg.darken(25)

  local blue      = hsl("#6c8ed4")
  local cyan      = hsl("#5fb3b3")
  local green     = hsl("#8fbf7f")
  local yellow    = hsl("#d7af5f")
  local orange    = hsl("#d9965b")
  local red       = hsl("#c75c6a")
  local magenta   = hsl("#b48ead")

  return {

    Normal       { fg = fg, bg = bg },
    NormalFloat  { fg = fg, bg = bg_alt },
    CursorLine   { bg = bg_alt.darken(5) },
    CursorColumn { CursorLine },

    LineNr       { fg = fg_dim },
    CursorLineNr { fg = yellow, gui = "bold" },

    ColorColumn  { bg = bg_alt },
    VertSplit    { fg = bg_alt.lighten(10) },
    WinSeparator { VertSplit },

    StatusLine   { fg = fg, bg = bg_alt },
    StatusLineNC { fg = fg_dim, bg = bg_alt.darken(10) },

    Visual       { bg = blue.darken(40) },
    Search       { fg = bg, bg = yellow },
    IncSearch    { fg = bg, bg = orange },

    Pmenu        { fg = fg, bg = bg_alt },
    PmenuSel     { fg = bg, bg = blue },
    MatchParen   { fg = orange, gui = "bold" },

    Whitespace   { fg = fg_dim.darken(10) },

    Comment      { fg = fg_dim, gui = "italic" },

    Constant     { fg = cyan },
    String       { fg = green },
    Character    { String },
    Number       { fg = orange },
    Boolean      { Number },
    Float        { Number },

    Identifier   { fg = fg },
    Function     { fg = yellow },

    Statement    { fg = blue },
    Conditional  { Statement },
    Repeat       { Statement },
    Label        { Statement },
    Operator     { fg = fg.lighten(10) },
    Keyword      { fg = blue, gui = "bold" },
    Exception    { fg = red },

    PreProc      { fg = magenta },
    Include      { PreProc },
    Define       { PreProc },
    Macro        { PreProc },

    Type         { fg = cyan },
    StorageClass { Type },
    Structure    { Type },
    Typedef      { Type },

    Special      { fg = orange },
    Delimiter    { fg = fg_dim },
    SpecialComment { fg = fg_dim.lighten(10) },

    Underlined   { gui = "underline", fg = blue },

    DiagnosticError { fg = red },
    DiagnosticWarn  { fg = yellow },
    DiagnosticInfo  { fg = blue },
    DiagnosticHint  { fg = cyan },

    DiagnosticUnderlineError { sp = red, gui = "undercurl" },
    DiagnosticUnderlineWarn  { sp = yellow, gui = "undercurl" },
    DiagnosticUnderlineInfo  { sp = blue, gui = "undercurl" },
    DiagnosticUnderlineHint  { sp = cyan, gui = "undercurl" },

    LspReferenceText  { bg = bg_alt.lighten(5) },
    LspReferenceRead  { LspReferenceText },
    LspReferenceWrite { bg = bg_alt.lighten(10) },

    sym("@comment") { Comment },

    sym("@string") { String },
    sym("@string.escape") { Special },
    sym("@number") { Number },
    sym("@boolean") { Boolean },
    sym("@float") { Float },

    sym("@function") { Function },
    sym("@function.call") { fg = yellow.lighten(10) },
    sym("@method") { Function },
    sym("@method.call") { fg = yellow.lighten(10) },

    sym("@variable") { Identifier },
    sym("@parameter") { fg = fg.lighten(10) },
    sym("@field") { fg = cyan.lighten(10) },
    sym("@property") { fg = cyan.lighten(10) },

    sym("@constant") { Constant },
    sym("@constant.builtin") { fg = cyan.lighten(15), gui = "bold" },

    sym("@keyword") { Keyword },
    sym("@keyword.return") { fg = blue.lighten(10), gui = "bold" },
    sym("@conditional") { Conditional },
    sym("@repeat") { Repeat },

    sym("@operator") { Operator },

    sym("@type") { Type },
    sym("@type.builtin") { fg = cyan.lighten(15), gui = "bold" },

    TelescopeNormal    { fg = fg, bg = bg_alt },
    TelescopeBorder    { fg = bg_alt.lighten(15) },
    TelescopeSelection { bg = bg_alt.lighten(8) },
    TelescopeMatching  { fg = yellow, gui = "bold" },

    DiffAdd    { bg = green.darken(50) },
    DiffChange { bg = blue.darken(50) },
    DiffDelete { bg = red.darken(50) },
    DiffText   { bg = blue.darken(40) },

  }
end)

