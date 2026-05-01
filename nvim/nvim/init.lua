vim.diagnostic.config({
    virtual_text = {
        current_line = true
    }
})

vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.laststatus = 3
vim.cmd('set background=dark')
vim.o.termguicolors = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim",                    load = true },
    "https://github.com/nvim-mini/mini.statusline.git",
    "https://github.com/gmr458/cold.nvim.git",
    "https://github.com/nvim-mini/mini.tabline.git",
    "https://github.com/stevearc/oil.nvim.git",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim.git",
    "https://github.com/windwp/nvim-autopairs.git",
    "https://github.com/nvim-tree/nvim-web-devicons.git",
    "https://github.com/L3MON4D3/LuaSnip.git",
    "https://github.com/blazkowolf/gruber-darker.nvim.git",
    "https://github.com/xero/miasma.nvim.git",
    "https://github.com/aktersnurra/no-clown-fiesta.nvim.git",
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
    { src = "https://github.com/nvim-telescope/telescope.nvim",            load = true },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", load = true, build = "make" },
})
vim.cmd("packloadall")

require("fidget").setup()
require("nvim-autopairs").setup {}
require("mini.statusline").setup({
})

require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})
require("mini.tabline").setup({
})


vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.enable('basedpyright')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
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


require 'blink.cmp'.setup({
    completion = {

        ghost_text = { enabled = true },
        menu = {
            -- winhighlight =
            -- "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            auto_show = true,
            auto_show_delay_ms = 500,
        },
        documentation = {
            auto_show = true,
            window = {
                border = "single",
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            }
        }

    },
})


vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", {})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>fw", builtin.grep_string)

vim.lsp.config["*"] = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
}
vim.cmd('colorscheme cold')
