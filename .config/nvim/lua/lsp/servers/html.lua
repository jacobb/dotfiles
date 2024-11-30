local M = {}

M.setup = function ()
  local lspconfig = require('lspconfig')
  lspconfig.html.setup {
    filetypes = {
      "html",
      "htmldjango",
      "jinja",
    }
  }
end

return M
