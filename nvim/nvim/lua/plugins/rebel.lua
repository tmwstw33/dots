local lush = require('lush')
local hsl = lush.hsl
---@diagnostic disable: undefined-global
return (lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- Основные цвета из твоей темы
		Normal { bg = hsl(222, 15, 6), fg = hsl(252, 100, 96) },

		search_base { bg =Normal.bg.li(30)},
		Visual { bg = Normal.bg.li(10)},

		Whitespace { fg = Normal.fg.da(50).de(100) },

		Search { search_base },
		IncSearch { bg = hsl("#8D6B94"), fg = Normal.bg },

		CursorLine { bg = Normal.bg.lighten(8) },
		CursorLineNr { fg = hsl("#8D6B94").lighten(20), gui = "bold" },

		ColorColumn { bg = Normal.bg.lighten(3) },
		VertSplit { fg = Normal.bg.lighten(18) },
		StatusLine { bg = Normal.bg.lighten(12) },
		Cursor { fg = Normal.bg, bg = Normal.fg },
		LineNr { fg = Normal.fg.darken(30).de(80) },
		Folded { fg = Normal.fg.darken(30).de(40), bg = Normal.bg.lighten(5) },
		FoldColumn { fg = Normal.fg.darken(30).de(40) },
		SignColumn { bg = Normal.bg },
		Pmenu { bg = Normal.bg.lighten(5), fg = Normal.fg },
		PmenuSel { bg = search_base.bg, fg = Normal.bg },
		PmenuSbar { bg = Normal.bg.lighten(10) },
		PmenuThumb { bg = Normal.fg.darken(0) },
		StatusLineNC { bg = Normal.bg.lighten(5), fg = Normal.fg.darken(30).de(40) },
		TabLine { bg = Normal.bg.lighten(5), fg = Normal.fg.darken(30) },
		TabLineSel { bg = Visual.bg, fg = Normal.bg },
		TabLineFill { bg = Normal.bg.lighten(5) },
		WinSeparator { fg = Normal.bg.lighten(15) },
		Comment { fg = hsl("#70877F").desaturate(40).darken(10), gui = "italic" },
		Statement { fg = hsl("#70877F").saturate(15), gui = "bold" },
		Identifier { fg = hsl("#3A506B").lighten(20) },
		Type { fg = hsl(352, 38, 60), gui = "italic" },
		Ignore { gui = "strikethrough", fg = Normal.fg.darken(40).de(60) },

		Constant { fg = hsl("#8B9D83").lighten(10) },

		String { fg = hsl("#8B9D83").lighten(5) },
		Number { fg = hsl("#70877F").lighten(15) },
		Character { fg = hsl("#8B9D83") },
		Boolean { fg = hsl("#70877F"), gui = "bold" },
		Float { fg = hsl("#70877F") },

		Function { fg = hsl("#3A506B").lighten(50) },

		Conditional { Statement },
		Repeat { Statement },
		Label { Statement },
		Operator { fg = Normal.fg.sa(30) },
		Keyword { fg = hsl("#8D6B94").lighten(10), gui = "bold" },
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
		DiagnosticError { fg = hsl("#e06c75").desaturate(20) },
		DiagnosticWarn { fg = hsl("#c2a65a").desaturate(20) },
		DiagnosticInfo { fg = hsl("#6f8fb3").desaturate(20) },
		DiagnosticHint { fg = hsl("#8b9d83") },

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

		-- ФУНКЦИИ: объявление vs вызов
		sym("@function") { fg = hsl("#3A506B").lighten(35) },
		sym("@function.call") { fg = hsl("#3A506B").lighten(50) },
		sym("@method") { fg = hsl("#3A506B").lighten(35) },
		sym("@method.call") { fg = hsl("#3A506B").lighten(50) },
		sym("@function.builtin") { Special },
		sym("@function.macro") { Macro },

		-- ПЕРЕМЕННЫЕ ПО РОЛЯМ
		sym("@variable") { Identifier },
		sym("@variable.builtin") { fg = hsl("#8D6B94"), gui = "bold" },
		sym("@parameter") { fg = hsl("#8B9D83").lighten(10) },
		sym("@field") { fg = hsl("#3A506B").lighten(35) },
		sym("@property") { fg = hsl("#3A506B").lighten(45) },
		sym("@variable.parameter") { fg = hsl("#8B9D83").lighten(10) },
		sym("@variable.member") { fg = hsl("#3A506B").lighten(35) },
		sym("@variable.local") { Identifier },
		sym("@variable.global") { fg = hsl("#3A506B").lighten(25) },

		-- КОНСТРУКТОРЫ
		sym("@constructor") { fg = hsl("#8D6B94").lighten(20), gui = "bold" },

		-- КЛЮЧЕВЫЕ СЛОВА ПО СМЫСЛУ
		sym("@keyword") { Keyword },
		sym("@keyword.function") { fg = hsl("#8D6B94").lighten(15), gui = "bold" },
		sym("@keyword.return") { fg = hsl("#8D6B94").lighten(25), gui = "bold" },
		sym("@conditional") { fg = hsl("#70877F").lighten(20), gui = "bold" },
		sym("@repeat") { fg = hsl("#70877F").lighten(20), gui = "bold" },
		sym("@keyword.operator") { Operator },
		sym("@label") { Label },
		sym("@exception") { Exception },

		-- ТИПЫ
		sym("@type") { fg = hsl(352, 38, 60), gui = "italic" },
		sym("@type.builtin") { fg = hsl("#8D6B94"), gui = "italic,bold" },
		sym("@type.definition") { fg = hsl(352, 38, 65), gui = "italic" },
		sym("@storageclass") { StorageClass },
		sym("@structure") { Structure },
		sym("@namespace") { Identifier },

		-- ПРЕПРОЦЕССОР
		sym("@include") { Include },
		sym("@preproc") { PreProc },
		sym("@debug") { Debug },

		-- ТЕГИ
		sym("@tag") { Tag },
		sym("@tag.delimiter") { Delimiter },

		-- Разметка / текст
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

		-- Атрибуты
		sym("@attribute") { PreProc },
		sym("@annotation") { PreProc },

		-- Док-строки
		sym("@string.documentation") { Comment },

		-- Операторы как логический акцент
		sym("@operator") { fg = hsl("#8D6B94").desaturate(10) },

		-- Diff
		sym("@diff.plus") { fg = hsl(120, 50, 65) },
		sym("@diff.minus") { fg = hsl(0, 70, 65) },
		sym("@diff.delta") { fg = hsl(40, 70, 65) },

		-- Markdown
		sym("@markup.heading") { fg = hsl("#8D6B94"), gui = "bold" },
		sym("@markup.list") { fg = Normal.fg },
		sym("@markup.bold") { gui = "bold" },
		sym("@markup.italic") { gui = "italic" },
		sym("@markup.link") { Underlined },
		sym("@markup.quote") { fg = Normal.fg.darken(20) },
		sym("@markup.raw") { fg = hsl("#8B9D83") },
		sym("@markup.math") { fg = hsl("#8D6B94") },
		sym("@markup.environment") { fg = hsl("#70877F") },

		sym("@conceal") { fg = Normal.fg.darken(30) },

	}
end))
