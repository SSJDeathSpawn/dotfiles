return {
    {
        -- Palenight Theme
        'marko-cerovac/material.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'material'
            require("material").setup {
                plugins = { -- Uncomment the plugins that you use to highlight them
                    -- Available plugins:
                    "dap",
                    -- "dashboard",
                    "gitsigns",
                    -- "hop",
                    "indent-blankline",
                    -- "lspsaga",
                    -- "mini",
                    -- "neogit",
                    -- "neorg",
                    "nvim-cmp",
                    -- "nvim-navic",
                    "nvim-tree",
                    "nvim-web-devicons",
                    -- "sneak",
                    "telescope",
                    -- "trouble",
                    "which-key",
                },

                disable = {
                },

                high_visibility = {
                    lighter = false, -- Enable higher contrast text for lighter style
                    darker = false   -- Enable higher contrast text for darker style_
                },

                lualine_style = "stealth"
            }
        end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'material',
                component_separators = '|',
                section_separators = { left = '', right = '' },
            },
        },
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            require('config.navic').setup()
        end,
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        main = "ibl",
        opts = {},
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        init = function() vim.g.barbar_auto_setup = false end,
        config = function()
            require 'barbar'.setup {
                animation = true,
                auto_hide = false,

                -- Enable/disable current/total tabpages indicator (top right corner)
                tabpages = true,

                -- Enables/disable clickable tabs
                --  - left-click: go to buffer
                --  - middle-click: delete buffer
                clickable = true,

                -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
                -- Valid options are 'left' (the default), 'previous', and 'right'
                focus_on_close = 'previous',

                insert_at_end = true,

                -- Set the filetypes which barbar will offset itself for
                sidebar_filetypes = {
                    -- Use the default values: {event = 'BufWinLeave', text = nil}
                    NvimTree = true,
                    -- Or, specify the text used for the offset:
                    undotree = { text = 'undotree' },
                    -- Or, specify the event which the sidebar executes when leaving:
                    ['neo-tree'] = { event = 'BufWipeout' },
                    -- Or, specify both
                    Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
                },

                -- New buffer letters are assigned in this order. This order is
                -- optimal for the qwerty keyboard layout but might need adjustment
                -- for other layouts.
                letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

                -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
                -- where X is the buffer number. But only a static string is accepted here.
                no_name_title = "Unnamed",
            }
        end,
        opts = {},
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            local nvim_tree = require "nvim-tree"


            nvim_tree.setup {
                actions = {
                    open_file = {
                        quit_on_open = true
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                renderer = {
                    root_folder_modifier = ":t",
                    -- These icons are visible when you install web-devicons
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                arrow_open = "",
                                arrow_closed = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "U",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                view = {
                    width = 30,
                    side = "left",
                },
            }
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup({
                '*',
                css = { css = true, },
            }, { mode = 'background', names = true })
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    }
}
