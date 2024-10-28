local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      library = {
        "${3rd}/love2d/library"
      }
    },
  },
}


local server_options = require('config.lsp.opts')

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = vim.tbl_deep_extend("force", server_options,
      servers[server_name] or {})
    require('lspconfig')[server_name].setup(opts)
  end,
}
