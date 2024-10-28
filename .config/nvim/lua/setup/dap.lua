return {
    {
        -- NOTE: Yes, you can install new plugins here!
        'mfussenegger/nvim-dap',
        -- NOTE: And you can specify dependencies as well
        dependencies = {
            -- Creates a beautiful debugger UI
            'rcarriga/nvim-dap-ui',

            -- Installs the debug adapters for you
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',

        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            'mfussenegger/nvim-dap',
            "mfussenegger/nvim-dap-python",
            "theHamsta/nvim-dap-virtual-text",
            "jbyuki/one-small-step-for-vimkind",
            "nvim-neotest/nvim-nio"
        },
        config = function()
            require('config.dap').setup()
        end,
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require('mason-nvim-dap').setup {
                automatic_installation = true,
                ensure_installed = { "codelldb", "cpptools" }
            }
        end
    },

    {
        'ldelossa/nvim-dap-projects'
    },
}
