local M = {}

local function config()
  local dap_breakpoint = {
    breakpoint = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function require_exts()
  require("nvim-dap-virtual-text").setup({
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = true,
    show_stop_reason = true,
    commented = vim.fn.has("nvim-0.10") ~= 1,
    only_first_definition = true,
    all_references = true,
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == "inline" then
        return " = " .. string.sub(variable.value, 1, 15)
      else
        return variable.name .. " = " .. variable.value
      end
    end,
    virt_text_pos = "eol", -- vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

    -- experimental features
    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
  })

  local dap, dapui = require "dap", require "dapui"
  dapui.setup()

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dapui.close()
  -- end
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dapui.close()
  -- end
end

local function configure_debuggers()
  require("config.dap.lua").setup()
  require("config.dap.python").setup()
  require("config.dap.ccpp").setup()
  require("config.dap.rust").setup()
  require("config.dap.kotlin").setup()
end

function M.setup()
  config() -- Configuration
  require_exts() -- Extensions
  configure_debuggers() -- Debugger
  require('config.dap.keymaps').setup()
end

return M
