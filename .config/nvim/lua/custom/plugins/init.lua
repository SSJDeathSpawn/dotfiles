return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
    init = function()
      require('init.rustaceanvim')
    end
  },
  {
    "pest-parser/pest.vim",
    config = function()
      require('pest-vim').setup {}
    end
  },
  {
    "olrtg/nvim-emmet",
    on_attach = function()
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
}
