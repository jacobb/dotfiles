local M = {}

M.setup = function ()
  local lspconfig = require('lspconfig')
  lspconfig.html.setup {
    filetypes = {
      "html",
      "htmldjango",
      "jinja",
      "jinja2",
      "jinja.html",
    }
  }
end

return M
