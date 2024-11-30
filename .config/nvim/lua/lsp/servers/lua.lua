local M = {}
M.setup = function ()
  local luaCapabilities = vim.lsp.protocol.make_client_capabilities()
  luaCapabilities.textDocument.completion.completionItem.snippetSupport = false

  local lspconfig = require('lspconfig')
  lspconfig.lua_ls.setup {
    capabilities = luaCapabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'hs' },
          disable = { "deprecated" }
        },
        format = {
          enable = true,
          -- Put format options here
          -- NOTE: the value should be STRING!!
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          }
        },
      }
    }
  }
end
return M
