return{{
    "mason-org/mason.nvim",
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"}
                        },
                    },
                }
            }
        }


    },
    dependencies = {
        "neovim/nvim-lspconfig", "mason-org/mason-lspconfig.nvim"
    },
    config = function (_, opts)
        require("mason").setup()
        require("mason-lspconfig").setup()
        for server, config in pairs(opts.servers) do
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end
        vim.diagnostic.config({
            virtual_text = true
        })
    end

}}
