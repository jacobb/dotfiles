local M = {}
M.setup = function()
  local lspconfig = require('lspconfig')
  lspconfig.cssls.setup({
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
      scss = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
      less = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
    },
  })
end
return M
