local cfg = require('rustaceanvim.config')
local server_options = require('config.lsp.opts')

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = vim.tbl_extend('force', server_options, {
        default_settings = {
            ['rust-analyzer'] = {

            },
        },
    }),
    -- DAP configuration
    dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
}
