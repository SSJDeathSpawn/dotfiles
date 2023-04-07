local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
local servers = { "html", "marksman", "yamlls", "rust_analyzer", "quick_lint_js", "eslint", "jedi_language_server"}

local pid = vim.fn.getpid()

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
end

lspconfig["omnisharp"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"/home/atomicstring/.local/share/nvim/mason/bin/omnisharp-mono", "--languageserver", "--hostPID", tostring(pid)}
}

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      }
    }
  }
})
