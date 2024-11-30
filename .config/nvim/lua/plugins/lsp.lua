return {
  "neovim/nvim-lspconfig",
  config = function ()
    require("lsp.servers.css").setup()
    require("lsp.servers.html").setup()
    require("lsp.servers.javascript").setup()
    require("lsp.servers.lua").setup()
    require("lsp.servers.python").setup()
    require("lsp.servers.rust").setup()
  end
}
