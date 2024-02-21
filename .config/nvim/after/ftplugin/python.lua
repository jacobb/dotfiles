vim.g.python_highlight_class_vars = 1
vim.g.python_highlight_builtins = 1
vim.g.python_highlight_all = 1
vim.g.python_highlight_string_format = 1

--[[
local root_dir = vim.fs.dirname(paths[1])
--pyright
local root_files = {'pyproject.toml'}
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
if root_dir then
  vim.lsp.start({
    cmd = {'pyright-langserver', '--stdio'},
    root_dir = root_dir,
    settings = { python = {} },
    capabilities = capabilities,
  })
  vim.lsp.start({
    cmd = {'ruff-lsp'},
    settings = { config = {} },
    root_dir = root_dir,
  })
end
]]
--
