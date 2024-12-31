local M = {}
M.setup = function ()
  local luaCapabilities = vim.lsp.protocol.make_client_capabilities()
  luaCapabilities.textDocument.completion.completionItem.snippetSupport = false
  local capabilities = require('blink.cmp').get_lsp_capabilities(luaCapabilities)

  local lspconfig = require('lspconfig')
  lspconfig.lua_ls.setup {
    capabilities = capabilities,
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
