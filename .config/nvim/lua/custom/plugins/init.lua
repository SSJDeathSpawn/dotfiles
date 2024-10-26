return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'custom.plugins.custom_lspconfig'
      require 'custom.plugins.lspconfig'
    end
  },
  {
    "https://git.sr.ht/~detegr/nvim-bqn"
  },
  {
    "mlochbaum/BQN",
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
    "mhartington/formatter.nvim",
  },
  {
    "pest-parser/pest.vim",
    config = function()
      require('pest-vim').setup {}
    end
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end,
  },
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {},
    keys = {
      { "<leader>v",  desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>",  desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", desc = "Stop LÖVE" },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require 'colorizer'.setup({
        '*',
        css = { css = true, },
      }, { mode = 'background', names = true })
    end
  }
}
