local lush = require("lush")
local hsl = lush.hsl

-- Muted darker palette
local bg        = hsl("#1c1f24")
local bg_alt    = bg.lighten(5)
local fg        = hsl("#c8ccd4")
local fg_muted  = fg.darken(20)

local gray      = hsl("#5c6370")
local red       = hsl("#c75c6a")
local green     = hsl("#8fb573")
local yellow    = hsl("#c9a75c")
local blue      = hsl("#6f8fbf")
local magenta   = hsl("#a57abf")
local cyan      = hsl("#6fa8a8")
local orange    = hsl("#c78c5c")

return lush(function()
  return {
    -- Base
    Normal       { fg = fg, bg = bg },
    NormalFloat  { fg = fg, bg = bg_alt },
    CursorLine   { bg = bg_alt },
    CursorColumn { CursorLine },
    ColorColumn  { bg = bg_alt.darken(5) },
    LineNr       { fg = gray },
    CursorLineNr { fg = fg },
    VertSplit    { fg = bg_alt.lighten(10), bg = bg },
    WinSeparator { VertSplit },

    -- Syntax (close to default but muted)
    Comment      { fg = fg_muted, gui = "italic" },
    Constant     { fg = cyan },
    String       { fg = green },
    Character    { String },
    Number       { fg = orange },
    Boolean      { fg = orange },
    Float        { Number },

    Identifier   { fg = fg },
    Function     { fg = blue },

    Statement    { fg = magenta },
    Conditional  { Statement },
    Repeat       { Statement },
    Label        { Statement },
    Operator     { fg = fg },
    Keyword      { fg = magenta },
    Exception    { Statement },

    PreProc      { fg = yellow },
    Include      { PreProc },
    Define       { PreProc },
    Macro        { PreProc },

    Type         { fg = yellow },
    StorageClass { Type },
    Structure    { Type },
    Typedef      { Type },

    Special      { fg = red },
    SpecialChar  { Special },
    Tag          { Special },

    -- UI
    Visual       { bg = bg_alt.lighten(8) },
    Search       { bg = yellow.darken(40), fg = fg },
    IncSearch    { bg = orange.darken(30), fg = bg },
    Pmenu        { fg = fg, bg = bg_alt },
    PmenuSel     { fg = bg, bg = blue },
    StatusLine   { fg = fg, bg = bg_alt },
    StatusLineNC { fg = gray, bg = bg_alt.darken(5) },

    -- Diagnostics (muted)
    DiagnosticError { fg = red },
    DiagnosticWarn  { fg = yellow },
    DiagnosticInfo  { fg = blue },
    DiagnosticHint  { fg = cyan },
  }
end)

