--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
--
--
local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- Основные цвета из твоей темы
		Normal { bg = hsl(222, 15, 6), fg = hsl(232, 6, 75) },

		search_base { bg = hsl("#8D6B94").li(30), fg = Normal.bg },

		Visual { bg = search_base.bg.da(70), fg = Normal.fg },

		Whitespace { fg = Normal.fg.darken(40) },

		Search { search_base },
		IncSearch { bg = hsl("#8D6B94"), fg = Normal.bg },

		CursorLine { bg = search_base.bg.da(85)},

		-- UI элементы
		ColorColumn { bg = Normal.bg.lighten(5) },
		Cursor { fg = Normal.bg, bg = Normal.fg },
		CursorLineNr { fg = Normal.fg, gui = "bold" },
		LineNr { fg = Normal.fg.darken(30) },
		VertSplit { fg = search_base.bg },
		Folded { fg = Normal.fg.darken(30), bg = Normal.bg.lighten(5) },
		FoldColumn { fg = Normal.fg.darken(30) },
		SignColumn { bg = Normal.bg },
		Pmenu { bg = Normal.bg.lighten(5), fg = Normal.fg },
		PmenuSel { bg = search_base.bg, fg = Normal.bg },
		PmenuSbar { bg = Normal.bg.lighten(10) },
		PmenuThumb { bg = Normal.fg.darken(0) },
		StatusLine { bg = Normal.bg.lighten(10), fg = Normal.fg },
		StatusLineNC { bg = Normal.bg.lighten(5), fg = Normal.fg.darken(30) },
		TabLine { bg = Normal.bg.lighten(5), fg = Normal.fg.darken(30) },
		TabLineSel { bg = Visual.bg, fg = Normal.bg },
		TabLineFill { bg = Normal.bg.lighten(5) },
		WinSeparator { fg = Normal.bg.lighten(15) },

		-- Синтаксические группы
		Comment { fg = Normal.fg.darken(40), gui = "italic" },

		Statement { fg = hsl("#70877F").saturate(15), gui = "bold" },
		Identifier { fg = hsl("#3A506B").lighten(30) },
		Type { fg = hsl("#8D6B94").saturate(10), gui = "italic" },
		Ignore { gui = "strikethrough", fg = Normal.fg.darken(40).lighten(30) },

		Constant { fg = hsl("#8B9D83").lighten(10) },
		String { fg = hsl("#8B9D83").desaturate(10) },
		Character { fg = hsl("#8B9D83") },
		Number { fg = hsl("#70877F") },
		Boolean { fg = hsl("#70877F"), gui = "bold" },
		Float { fg = hsl("#70877F") },

		Function { fg = hsl("#3A506B").lighten(40) },

		Conditional { Statement },
		Repeat { Statement },
		Label { Statement },
		Operator { fg = Normal.fg.darken(20) },
		Keyword { fg = hsl("#70877F").lighten(10), gui = "bold" },
		Exception { fg = hsl("#8D6B94"), gui = "bold" },

		PreProc { fg = hsl("#8D6B94").desaturate(20) },
		Include { PreProc },
		Define { PreProc },
		Macro { PreProc },
		PreCondit { PreProc },

		StorageClass { Type },
		Structure { Type },
		Typedef { Type },

		Special { fg = hsl("#8B9D83") },
		SpecialChar { fg = hsl("#8B9D83") },
		Tag { fg = hsl("#70877F") },
		Delimiter { fg = Normal.fg.darken(20) },
		SpecialComment { fg = Normal.fg.darken(40), gui = "bold,italic" },
		Debug { fg = hsl("#8D6B94") },

		Underlined { gui = "underline", fg = hsl("#3A506B").lighten(20) },
		Error { fg = hsl(0, 70, 65), bg = Normal.bg.lighten(5) },
		Todo { fg = Normal.bg, bg = hsl("#8B9D83"), gui = "bold" },

		-- LSP
		DiagnosticError { fg = hsl(0, 70, 65) },
		DiagnosticWarn { fg = hsl(40, 70, 65) },
		DiagnosticInfo { fg = hsl(200, 70, 65) },
		DiagnosticHint { fg = hsl(120, 50, 65) },

		DiagnosticUnderlineError { gui = "undercurl", sp = hsl(0, 70, 65) },
		DiagnosticUnderlineWarn { gui = "undercurl", sp = hsl(40, 70, 65) },
		DiagnosticUnderlineInfo { gui = "undercurl", sp = hsl(200, 70, 65) },
		DiagnosticUnderlineHint { gui = "undercurl", sp = hsl(120, 50, 65) },

		-- Treesitter
		sym("@text.literal") { Comment },
		sym("@text.reference") { Identifier },
		sym("@text.title") { fg = hsl("#70877F"), gui = "bold" },
		sym("@text.uri") { Underlined },
		sym("@text.underline") { Underlined },
		sym("@text.todo") { Todo },

		sym("@comment") { Comment },
		sym("@punctuation") { Delimiter },
		sym("@punctuation.delimiter") { Delimiter },
		sym("@punctuation.bracket") { Delimiter },
		sym("@punctuation.special") { SpecialChar },

		sym("@constant") { Constant },
		sym("@constant.builtin") { fg = hsl("#8D6B94"), gui = "bold" },
		sym("@constant.macro") { Define },

		sym("@define") { Define },
		sym("@macro") { Macro },

		sym("@string") { String },
		sym("@string.escape") { SpecialChar },
		sym("@string.special") { SpecialChar },
		sym("@string.regex") { fg = hsl("#8D6B94") },

		sym("@character") { Character },
		sym("@character.special") { SpecialChar },

		sym("@number") { Number },
		sym("@boolean") { Boolean },
		sym("@float") { Float },

		sym("@function") { Function },
		sym("@function.builtin") { Special },
		sym("@function.macro") { Macro },

		sym("@parameter") { Identifier },
		sym("@method") { Function },
		sym("@field") { Identifier },
		sym("@property") { Identifier },

		sym("@constructor") { Special },

		sym("@conditional") { Conditional },
		sym("@repeat") { Repeat },
		sym("@label") { Label },
		sym("@operator") { Operator },
		sym("@keyword") { Keyword },
		sym("@exception") { Exception },

		sym("@variable") { Identifier },
		sym("@type") { Type },
		sym("@type.definition") { Typedef },
		sym("@storageclass") { StorageClass },
		sym("@structure") { Structure },
		sym("@namespace") { Identifier },

		sym("@include") { Include },
		sym("@preproc") { PreProc },
		sym("@debug") { Debug },
		sym("@tag") { Tag },
		sym("@tag.delimiter") { Delimiter },

		-- Дополнительные treesitter группы
		sym("@text") { fg = Normal.fg },
		sym("@text.strong") { gui = "bold" },
		sym("@text.emphasis") { gui = "italic" },
		sym("@text.strike") { gui = "strikethrough" },
		sym("@text.math") { fg = hsl("#8D6B94") },
		sym("@text.environment") { fg = hsl("#70877F") },
		sym("@text.environment.name") { fg = hsl("#3A506B") },
		sym("@text.note") { fg = hsl(200, 70, 65) },
		sym("@text.warning") { fg = hsl(40, 70, 65) },
		sym("@text.danger") { fg = hsl(0, 70, 65) },

		sym("@attribute") { PreProc },
		sym("@annotation") { PreProc },

		sym("@variable.builtin") { fg = hsl("#8D6B94"), gui = "bold" },

		sym("@type.builtin") { fg = hsl("#8D6B94"), gui = "italic" },

		sym("@keyword.function") { Keyword },
		sym("@keyword.operator") { Operator },
		sym("@keyword.return") { Keyword },

		sym("@function.call") { Function },
		sym("@method.call") { Function },

		sym("@string.documentation") { Comment },

		sym("@diff.plus") { fg = hsl(120, 50, 65) },
		sym("@diff.minus") { fg = hsl(0, 70, 65) },
		sym("@diff.delta") { fg = hsl(40, 70, 65) },

		sym("@markup.heading") { sym("@text.title") },
		sym("@markup.list") { fg = Normal.fg },
		sym("@markup.bold") { gui = "bold" },
		sym("@markup.italic") { gui = "italic" },
		sym("@markup.link") { Underlined },
		sym("@markup.quote") { fg = Normal.fg.darken(20) },
		sym("@markup.raw") { fg = hsl("#8B9D83") },
		sym("@markup.math") { sym("@text.math") },
		sym("@markup.environment") { sym("@text.environment") },

		sym("@conceal") { fg = Normal.fg.darken(30) },
	}
end)

return theme
