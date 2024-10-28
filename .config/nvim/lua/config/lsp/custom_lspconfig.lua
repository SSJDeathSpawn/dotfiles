local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

if not configs.bqnlsp then
  configs.bqnlsp = {
    default_config = {
      cmd = { 'bqnlsp' },
      cmd_env = {},
      filetypes = { 'bqn' },
      root_dir = util.find_git_ancestor,
      single_file_support = false,
    },
    docs = {
      description = [[
      BQN Language Server
  ]],
      default_config = {
        root_dir = [[util.find_git_ancestor]],
      },
    },
  }
end

if not configs.curlylint then
  configs.curlylint = {
    default_config = {
      cmd = { 'curlylint' },
      cmd_env = {},
      filetypes = { 'jinja.html' },
      root_dir = function(startpath)
        local start_path = util.find_git_ancestor(startpath)
        start_path = start_path or util.root_pattern('templates', 'views')(startpath)
        local templates = start_path .. '/templates'
        local views = start_path .. '/views'
        if util.path.exists(templates) then
          return templates
        elseif util.path.exists(templates) then
          return views
        end
        return start_path
      end,
      single_file_support = false,
    },
    docs = {
      description = [[
      CurlyLint
      ]]
    },
  }
end
