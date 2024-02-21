vim.diagnostic.config({
  virtual_text = false,
})

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('i', '<C-b>', '<C-x><C-o>')
vim.keymap.set('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', '<Leader>F', '<cmd>lua vim.lsp.buf.format()<cr>')
vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.opt.completeopt = { "menu" }


-- define autocmd to listen for CompleteDone
vim.api.nvim_create_autocmd('CompleteDone', {
  callback = function ()
    local completed_item = vim.v.completed_item
    if not (completed_item and completed_item.user_data and
        completed_item.user_data.nvim and completed_item.user_data.nvim.lsp and
        completed_item.user_data.nvim.lsp.completion_item) then
      return
    end

    local item = completed_item.user_data.nvim.lsp.completion_item
    local bufnr = vim.api.nvim_get_current_buf()
    local completed = false
    vim.lsp.buf_request(bufnr, "completionItem/resolve", item,
      function (_, _, result)
        if result and result.params and result.params.additionalTextEdits then
          if not completed then
            vim.lsp.util.apply_text_edits(result.params.additionalTextEdits,
              bufnr, "utf-8")
            completed = true
          end
        end
      end
    )
  end,
})

-- Populate loclist with the current buffer diagnostics
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function ()
    vim.diagnostic.setloclist({ open = false })
  end,
})


--lua
local luaCapabilities = vim.lsp.protocol.make_client_capabilities()
luaCapabilities.textDocument.completion.completionItem.snippetSupport = false
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
  capabilities = luaCapabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'hs' }
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
--python
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

lspconfig.pyright.setup({
  capabilities = capabilities,
})
lspconfig.ruff_lsp.setup({})

-- js/ts
lspconfig.tsserver.setup({})

-- rust
require('lspconfig').rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
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
