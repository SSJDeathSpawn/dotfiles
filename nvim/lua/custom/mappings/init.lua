local M = {}

M.disabled = {
 n = {
    ["<leader>x"] = "",
    ["<C-e>"] = "",
    ["<C-y>"] = "",
  }
}

M.tabs = {
  n = {
    ["<C-w>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    }
  }
}

return M
