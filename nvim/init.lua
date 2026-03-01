vim.diagnostic.config({
	virtual_text = {
		current_line = true
	}
})

vim.o.laststatus = 3
vim.cmd('set background=dark')
vim.o.termguicolors = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>b", ":Ex<CR>", {})

vim.pack.add({
	"https://github.com/L3MON4D3/LuaSnip.git",
	"https://github.com/rktjmp/lush.nvim.git",
	"https://github.com/nvim-treesitter/nvim-treesitter.git",
	"https://github.com/mason-org/mason.nvim.git",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim.git",
	"https://github.com/j-hui/fidget.nvim.git",
	"https://github.com/windwp/nvim-autopairs.git",
	{ src = "https://github.com/saghen/blink.cmp.git",          version = 'v1.8.0', },
	"https://github.com/nvim-tree/nvim-web-devicons.git",
	"https://github.com/goolord/alpha-nvim.git",
	"https://github.com/gmr458/cold.nvim.git",
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
	"https://github.com/lewis6991/gitsigns.nvim",
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-mini/mini.statusline.git",
	"https://github.com/nvim-tree/nvim-tree.lua.git",
	"https://github.com/zenbones-theme/zenbones.nvim.git",
	"https://github.com/lucasadelino/conifer.nvim.git",
	"https://github.com/leobeosab/tearout.nvim.git",
	"https://github.com/xero/miasma.nvim.git",
	"https://github.com/rockerBOO/boo-colorscheme-nvim.git",
	"https://github.com/bluz71/vim-moonfly-colors.git",


})
require("bufferline").setup {}
require("nvim-tree").setup()
require("oil").setup({
	view_options = {
		show_hidden = true,
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
require("gitsigns").setup()
require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},

	pickers = {
	},
	extensions = {
	}
}
--ssh reminder
--nvim oil-ssh://[username@]hostname[:port]/[path]
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>fw", builtin.grep_string)

require("mason").setup()
require("mason-lspconfig").setup()
require 'nvim-treesitter'.install { 'rust', 'javascript', 'zig', 'c', 'go', 'lua', 'python', 'css' }
require 'blink.cmp'.setup({
	completion = {

		ghost_text = { enabled = true },
		menu = {
			border = "single",
			-- winhighlight =
			-- "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		documentation = {
			window = {
				border = "single",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
			}
		}

	},
})

require("fidget").setup()
require("nvim-autopairs").setup {}

local alpha = require("alpha")
local startify = require("alpha.themes.startify")
startify.section.mru_cwd.opts = {
	position = "center",
}
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
startify.section.top_buttons.val = {}
startify.section.bottom_buttons.val = {}
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
vim.opt.termguicolors = true
vim.o.cursorline = true

vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
})
vim.cmd('colorscheme forest_stream')

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
--floating term
function _G.floating_terminal()
	local buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.5)

	local row = math.floor((vim.o.lines - height) / 1)
	local col = math.floor((vim.o.columns + width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "single",
	})

	vim.fn.termopen(vim.o.shell)
	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", floating_terminal, { noremap = true, silent = true })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:q<CR>]])
require("mini.statusline").setup({


})



-- apply it as a colorscheme
--
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
