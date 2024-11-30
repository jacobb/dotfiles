local M = {}

M.setup = function ()
  local lspconfig = require('lspconfig')
  lspconfig.biome.setup {
    filestypes = {
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "typescript",
      "typescript.tsx",
      "typescriptreact",
    }
  }
end

return M
