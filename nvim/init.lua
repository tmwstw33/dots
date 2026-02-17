vim.o.number = true
vim.diagnostic.config({
	virtual_text = {
		current_line = true
	}
})
vim.o.laststatus = 3
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.guicursor = "i:block"
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>b", ":Ex<CR>", {})



vim.pack.add({
	"https://github.com/L3MON4D3/LuaSnip.git",
	"https://github.com/rafamadriz/friendly-snippets.git",
	"https://github.com/rktjmp/lush.nvim.git",
	"https://github.com/nvim-treesitter/nvim-treesitter.git",
	"https://github.com/mason-org/mason.nvim.git",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim.git",
	"https://github.com/vimpostor/vim-tpipeline.git",
	"https://github.com/j-hui/fidget.nvim.git",
	"https://github.com/sschleemilch/slimline.nvim.git",
	"https://github.com/windwp/nvim-autopairs.git",
	{ src = "https://github.com/saghen/blink.cmp.git", version = 'v1.8.0', },
	"https://github.com/darkvoid-theme/darkvoid.nvim.git",
	"https://github.com/nvim-tree/nvim-web-devicons.git",
	"https://github.com/goolord/alpha-nvim.git",
})

-- setup must be called before loading
require('darkvoid').setup({
	transparent = false,
	glow = true,
	show_end_of_buffer = true,

	colors = {
		fg = "#c0c0c0",
		bg = "#090E13",
		cursor = "#bdfe58",
		line_nr = "#404040",
		visual = "#303030",
		comment = "#585858",
		string = "#d1d1d1",
		func = "#e1e1e1",
		kw = "#f1f1f1",
		identifier = "#b1b1b1",
		type = "#a1a1a1",
		type_builtin = "#c5c5c5", -- current
		-- type_builtin = "#8cf8f7", -- glowy blue old (was present by default before type_builtin was introduced added here for people who may like it)
		search_highlight = "#1bfd9c",
		operator = "#1bfd9c",
		bracket = "#e6e6e6",
		preprocessor = "#4b8902",
		bool = "#66b2b2",
		constant = "#b2d8d8",

		-- enable or disable specific plugin highlights
		plugins = {
			gitsigns = true,
			nvim_cmp = true,
			treesitter = true,
			nvimtree = true,
			telescope = true,
			lualine = true,
			bufferline = true,
			oil = true,
			whichkey = true,
			nvim_notify = true,
		},

		-- gitsigns colors
		added = "#baffc9",
		changed = "#ffffba",
		removed = "#ffb3ba",

		-- Pmenu colors
		pmenu_bg = "#1c1c1c",
		pmenu_sel_bg = "#1bfd9c",
		pmenu_fg = "#c0c0c0",

		-- EndOfBuffer color
		eob = "#3c3c3c",

		-- Telescope specific colors
		border = "#585858",
		title = "#bdfe58",

		-- bufferline specific colors
		bufferline_selection = "#1bfd9c",

		-- LSP diagnostics colors
		error = "#dea6a0",
		warning = "#d6efd8",
		hint = "#bedc74",
		info = "#7fa1c3",
	},
})

vim.cmd("colorscheme darkvoid")

require("mason").setup()
require("mason-lspconfig").setup()
require 'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'c', 'go', 'lua', 'python', 'css' }
require 'blink.cmp'.setup({
	completion = {

		ghost_text = { enabled = true },
		menu = {

			auto_show = true,
			auto_show_delay_ms = 500,
		}

	},
})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

require("fidget").setup()

-- require('lualine').setup({
--   options = {
--     theme = 'auto',
--     icons_enabled = true,
--     component_separators = '',
--     section_separators = '',
--     always_divide_middle = true,
--     globalstatus = false,
--   },
--
--   sections = {
--
--     -- MODE ICON
--     lualine_a = {
--       {
--         function()
--           return "  "
--         end,
--         color = function()
--           local m = vim.fn.mode()
--           return {
--             bg = "#090E13",
--             fg =
--               (m == "n" and "#c5c5c5") or
--               (m == "i" and "#bdfe58") or
--               (m == "v" and "#1bfd9c") or
--               (m == "V" and "#1bfd9c") or
--               (m == "" and "#1bfd9c") or
--               (m == "c" and "#4b8902") or
--               (m == "R" and "#66b2b2") or
--               (m == "t" and "#b2d8d8") or
--               "#c0c0c0",
--             gui = "bold",
--           }
--         end,
--         padding = { left = 1, right = 1 },
--       }
--     },
--
--     -- EMPTY (чтобы не шумело)
--     lualine_b = {'diagnostics'},
--
--     -- FILENAME (центр)
--     lualine_c = {
--       {
--         'filename',
--         path = 1,
--         shorting_target = 40,
--         max_length = vim.o.columns * 0.4,
--         symbols = {
--           modified = ' ●',
--           readonly = '',
--           unnamed = '',
--         },
--       }
--     },
--
--     -- DIAGNOSTICS (минимал)
--     lualine_x = {
--       {
--         'filetype',
--       }
--     },
--
--     -- POSITION
--     lualine_y = {
--       { 'progress' }
--     },
--
--     lualine_z = {
--       { 'location' }
--     },
--   },
--
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { 'filename' },
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
-- })
-- require('lualine').setup {
-- 	options = {
-- 		icons_enabled = true,
-- 		fmt = string.lower,
-- 		theme = 'auto',
-- 		component_separators = { left = ' ', right = ' ' },
-- 		section_separators = { left = ' ', right = ' ' },
-- 		disabled_filetypes = {
-- 			statusline = {},
-- 			winbar = {},
-- 		},
-- 		ignore_focus = {},
-- 		always_divide_middle = true,
-- 		always_show_tabline = true,
-- 		globalstatus = false,
-- 		refresh = {
-- 			statusline = 1000,
-- 			tabline = 1000,
-- 			winbar = 1000,
-- 			refresh_time = 16, -- ~60fps
-- 			events = {
-- 				'WinEnter',
-- 				'BufEnter',
-- 				'BufWritePost',
-- 				'SessionLoadPost',
-- 				'FileChangedShellPost',
-- 				'VimResized',
-- 				'Filetype',
-- 				'CursorMoved',
-- 				'CursorMovedI',
-- 				'ModeChanged',
-- 			},
-- 		}
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				function()
-- 					return ""
-- 				end,
-- 				color = function()
-- 					local m = vim.fn.mode()
-- 					return {
-- 						bg = "#090E13", -- твой bg
-- 						fg =
-- 							(m == "n" and "#c5c5c5") or
-- 							(m == "i" and "#bdfe58") or
-- 							(m == "v" and "#1bfd9c") or
-- 							(m == "V" and "#1bfd9c") or
-- 							(m == "" and "#1bfd9c") or
-- 							(m == "c" and "#4b8902") or
-- 							(m == "R" and "#66b2b2") or
-- 							(m == "t" and "#b2d8d8") or
-- 							"#c0c0c0",
-- 						gui = "bold",
-- 					}
-- 				end,
-- 				padding = 0,
-- 			}
-- 		},
-- 		lualine_b = { 'branch', 'diff', 'diagnostics' },
-- 		lualine_c = { { 'filename', path = 2, shorting_target = 20 } },
-- 		lualine_x = { 'filetype' },
-- 		lualine_y = { 'progress' },
-- 		lualine_z = { 'location' }
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = { 'filename' },
-- 		lualine_x = { 'location' },
-- 		lualine_y = {},
-- 		lualine_z = {}
-- 	},
-- 	tabline = {},
-- 	winbar = {},
-- 	inactive_winbar = {},
-- 	extensions = {}
-- }
require("nvim-autopairs").setup {}

local alpha = require("alpha")
local startify = require("alpha.themes.startify")
startify.section.mru_cwd.opts = {
  position = "center",
}


-- Unique asymmetric header
startify.section.header.val = {

	"                                        _            .                        ",
	"                                       u            @88>                      ",
	"   u.    u.                     u.    88Nu.   u.    %8P      ..    .     :    ",
	" x@88k u@88c.      .u     ...ue888b  '88888.o888c    .     .888: x888  x888.  ",
	"^\"8888\"\"8888\"   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~'888X`?888f` ",
	"  8888  888R  :888'8888.  888R I888>   8888  8888 ''888E`   X888  888X '888>  ",
	"  8888  888R  d888 '88%\"  888R I888>   8888  8888   888E    X888  888X '888>  ",
	"  8888  888R  8888.+\"     888R I888>   8888  8888   888E    X888  888X '888>  ",
	"  8888  888R  8888L      u8888cJ888   .8888b.888P   888E    X888  888X '888>  ",
	" \"*88*\" 8888\" '8888c. .+  \"*888*P\"     ^Y8888*\"\"    888&   \"*88%\"\"*88\" '888!` ",
	"   \"\"   'Y\"    \"88888%      'Y\"          `Y\"        R888\"    `~    \"    `\"`   ",
	"                 \"YP'                                \"\"                       ",
	"                                                                              ",
	"                                                                              ",
	"                                                                              ",
}

startify.section.header.opts = {
	position = "center",
	hl = "Normal",
}

-- Remove buttons for cleaner layout
startify.section.top_buttons.val = {}
startify.section.bottom_buttons.val = {}

-- Custom layout (unique structure)
alpha.setup({
	layout = {
		{ type = "padding", val = 6 },
		startify.section.header,
		{ type = "padding", val = 3 },
		{ type = "padding", val = 1 },
		startify.section.mru_cwd,

	},
	opts = {
		margin = 5,
	},
})


vim.api.nvim_set_hl(0, "StatusLine", { bg = "#111921", fg = "#c0c0c0" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#090E13", fg = "#585858" })
