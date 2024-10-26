local M = {}

function M.setup()
  local dap = require "dap"
  local mason_registry = require("mason-registry")
  local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
  local codelldb_path = codelldb_root .. "adapter/codelldb"
  local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

  dap.adapters.rust = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)

end

return M
