local lush = require('lush')
local hsl = lush.hsl
---@diagnostic disable: undefined-global
return (lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- Базовые цвета
    Normal      { bg = hsl(240, 17, 12), fg = hsl(240, 100, 98) },  -- фон и основной текст
    search_base { bg = Normal.bg.li(30) },
    Visual      { bg = Normal.bg.li(10) },
    
    Whitespace  { fg = Normal.fg.da(50).de(100) },
    
    Search      { search_base },
    IncSearch   { bg = hsl(183, 31, 34), fg = Normal.bg },
    
    CursorLine  { bg = Normal.bg.lighten(8) },
    CursorLineNr{ fg = hsl(183, 31, 34).lighten(20), gui = "bold" },
    
    ColorColumn { bg = Normal.bg.lighten(3) },
    VertSplit   { fg = Normal.bg.lighten(18) },
    StatusLine  { bg = Normal.bg.lighten(12) },
    Cursor      { fg = Normal.bg, bg = Normal.fg },
    LineNr      { fg = Normal.fg.darken(30).de(80) },
    Folded      { fg = Normal.fg.darken(30).de(40), bg = Normal.bg.lighten(5) },
    FoldColumn  { fg = Normal.fg.darken(30).de(40) },
    SignColumn  { bg = Normal.bg },
    Pmenu       { bg = Normal.bg.lighten(5), fg = Normal.fg },
    PmenuSel    { bg = search_base.bg, fg = Normal.bg },
    PmenuSbar   { bg = Normal.bg.lighten(10) },
    PmenuThumb  { bg = Normal.fg.darken(0) },
    StatusLineNC{ bg = Normal.bg.lighten(5), fg = Normal.fg.darken(30).de(40) },
    TabLine     { bg = Normal.bg.lighten(5), fg = Normal.fg.darken(30) },
    TabLineSel  { bg = Visual.bg, fg = Normal.bg },
    TabLineFill { bg = Normal.bg.lighten(5) },
    WinSeparator{ fg = Normal.bg.lighten(15) },
    Comment     { fg = hsl(240, 15, 50).desaturate(20), gui = "italic" },
    
    Statement   { fg = hsl(8, 34, 54), gui = "bold" },
    Identifier  { fg = hsl(8, 34, 54).lighten(20) },
    Type        { fg = hsl(154, 39, 33), gui = "italic" },
    Constant    { fg = hsl(154, 39, 33).lighten(10) },
    String      { fg = hsl(154, 39, 33).lighten(5) },
    Number      { fg = hsl(8, 34, 54).lighten(15) },
    Boolean     { fg = hsl(8, 34, 54), gui = "bold" },
    Float       { fg = hsl(8, 34, 54) },
    
    Function    { fg = hsl(8, 34, 54).lighten(50) },
    
    Keyword     { fg = hsl(183, 31, 34).lighten(10), gui = "bold" },
    Exception   { fg = hsl(183, 31, 34), gui = "bold" },
    
    Operator    { fg = Normal.fg.sa(30) },
    
    Underlined  { gui = "underline", fg = hsl(8, 34, 54).lighten(20) },
    Error       { fg = hsl(0, 70, 65), bg = Normal.bg.lighten(5) },
    Todo        { fg = Normal.bg, bg = hsl(154, 39, 33), gui = "bold" },
    
    -- LSP
    DiagnosticError { fg = hsl(0, 70, 65).desaturate(20) },
    DiagnosticWarn  { fg = hsl(40, 70, 60).desaturate(20) },
    DiagnosticInfo  { fg = hsl(210, 50, 60).desaturate(20) },
    DiagnosticHint  { fg = hsl(150, 40, 50) },
    
    DiagnosticUnderlineError { gui = "undercurl", sp = hsl(0, 70, 65) },
    DiagnosticUnderlineWarn  { gui = "undercurl", sp = hsl(40, 70, 60) },
    DiagnosticUnderlineInfo  { gui = "undercurl", sp = hsl(210, 50, 60) },
    DiagnosticUnderlineHint  { gui = "undercurl", sp = hsl(150, 40, 50) },

    -- Простейшие деревья (Treesitter) и прочее можно аналогично наследовать цвета
  }
end))
