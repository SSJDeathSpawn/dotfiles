local lsp = require('lspconfig')
local util = require('lspconfig.util')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {'bqnlsp', 'jedi_language_server', 'pylsp', 'tailwindcss', 'curlylint', 'pest_ls', 'emmet_language_server', 'ts_ls'}

for _, server in ipairs(servers) do
  lsp[server].setup{
    capabilities = capabilities,
  }
end

lsp.eslint.setup {
  root_dir = function(startpath)
    return util.find_git_ancestor(startpath)
  end
}

lsp.glslls.setup {
  filetypes = { "glsl", "vert", "vs", "vsh", "tesc", "tese", "frag", "fs", "fsh", "geom", "gs", "gsh", "comp"}
}

-- lsp['rust_analyzer'].setup {
--     assist = {
--         importEnforceGranularity = true,
--         importPrefix = 'crate',
--     },
--     cargo = {
--         allFeatures = true,
--     },
--     checkOnSave = {
--         command = 'clippy',
--     },
--     inlayHints = { locationLinks = false },
--     diagnostics = {
--         enable = true,
--         experimental = {
--             enable = true,
--         },
--     },
-- }

-- lsp['efm'].setup {
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             lua = {
--                 {formatCommand = "lua-format -i", formatStdin = true}
--             }
--         }
--     }
-- }

