local M = {}

M.setup = function ()
  local on_attach = function (client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end

  local lspconfig = require("lspconfig")
  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
      ['rust-analyzer'] = {
        cachePriming = {
          -- enable = false
        },
        checkOnSave = {
          allFeatures = true,
          overrideCommand = {
            'cargo', 'clippy', '--workspace', '--message-format=json',
            '--all-targets', '--all-features'
          }
        }
      }
    }
  }
end

return M
