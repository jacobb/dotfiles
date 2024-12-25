local M = {}
local util = require 'lspconfig.util'

M.setup = function ()
  local lspconfig = require('lspconfig')
  lspconfig.biome.setup({
    filestypes = {
      "css",
      "html",
      "jinja.html",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
    },
    root_dir = util.root_pattern('package.json', '.git'),
  })
end

return M
