vim.o.number = true
vim.diagnostic.config({
	virtual_text = {
		current_line = true
	}
})
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
	"https://github.com/webhooked/kanso.nvim.git",
	"https://github.com/L3MON4D3/LuaSnip.git",
	"https://github.com/rafamadriz/friendly-snippets.git",
	"https://github.com/rktjmp/lush.nvim.git",
	"https://github.com/zenbones-theme/zenbones.nvim.git",
	"https://github.com/nvim-treesitter/nvim-treesitter.git",
	"https://github.com/mason-org/mason.nvim.git",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim.git",
	"https://github.com/vimpostor/vim-tpipeline.git",
	"https://github.com/j-hui/fidget.nvim.git",
	"https://github.com/sschleemilch/slimline.nvim.git",
	"https://github.com/uhs-robert/oasis.nvim.git",
	"https://github.com/windwp/nvim-autopairs.git",
	"https://github.com/jpwol/thorn.nvim.git",
	{ src = "https://github.com/saghen/blink.cmp.git", version = 'v1.8.0', },
	"https://github.com/nvim-lualine/lualine.nvim.git",
})
-- Default options:
require('kanso').setup({
    bold = true,                 -- enable bold fonts
    italics = true,             -- enable italics
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = {},
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    background = {               -- map the value of 'background' option to a theme
        dark = "zen",           -- try "zen", "mist" or "pearl" !
        light = "pearl"         -- try "zen", "mist" or "ink" !
    },
    foreground = "default",      -- "default" or "saturated" (can also be a table like background)
    minimal = false,             -- reduced color palette for a more minimal look
})

-- setup must be called before loading
vim.cmd("colorscheme kanso")

vim.cmd("colorscheme kanso")
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
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     always_show_tabline = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--       refresh_time = 16, -- ~60fps
--       events = {
--         'WinEnter',
--         'BufEnter',
--         'BufWritePost',
--         'SessionLoadPost',
--         'FileChangedShellPost',
--         'VimResized',
--         'Filetype',
--         'CursorMoved',
--         'CursorMovedI',
--         'ModeChanged',
--       },
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
--
require("slimline").setup({
	style = "fg",
	bold = true,
	configs = {
		path = {
			hl = {
				primary = 'Label',
			},
		},
		git = {
			hl = {
				primary = 'Function',
			},
		},
		filetype_lsp = {
			hl = {
				primary = 'String',
			},
		},
	},
    -- spaces = {
    --     components = "",
    --     left = "",
    --     right = "",
    -- },
    -- sep = {
    --     hide = {
    --         first = true,
    --         last = true,
    --     },
    --     left = "",
    --     right = "",
    -- },
})

require("nvim-autopairs").setup {}


