local M = {}
M.setup = function()
  local lspconfig = require('lspconfig')
  lspconfig.cssls.setup{}
end
return M
