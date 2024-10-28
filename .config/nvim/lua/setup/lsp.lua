return {
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        config = function()
            require 'config.lsp.custom_lspconfig'
            require 'config.lsp.lspconfig'
            require 'config.lsp.autoformat'
        end,
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            {
                'williamboman/mason.nvim',
                config = function()
                    require("mason").setup({
                        PATH = "prepend"
                    })
                end
            },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        { path = "luvit-meta/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        config = function()
            require('config.lsp.cmp')
        end,
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',

            -- Random Assortment
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

            --For vsnip
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            { "nushell/tree-sitter-nu" }
        },
        config = function()
            require('config.lsp.treesitter')
        end,
        build = ':TSUpdate',
    },

    {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup {
                formatters_by_ft = {
                    c = { "clang_format" },
                    python = { "black" },
                    lua = { "stylua" },
                    html = { "prettierd" },
                    javascript = { "prettierd" },
                    markdown = { "prettierd" },
                    json = { "prettierd" },
                    yaml = { "prettierd" },
                    css = { "prettierd" },
                    julia = { "injected" }
                },
                notify_on_error = true,
            }
        end
    },

    {
        "mhartington/formatter.nvim",
    },
}
