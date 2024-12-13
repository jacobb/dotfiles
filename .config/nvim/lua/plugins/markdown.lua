return {
  { dir = "/Users/jacob/src/ink-nvim", name = "ink-nvim" },
  {
    "folke/zen-mode.nvim",
    ft = { "markdown", "mail", "text" },
    opts = function ()
      vim.api.nvim_create_augroup('ZenModeFix', { clear = true })
      vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
        group = 'ZenModeFix',
        callback = function () require('zen-mode').close() end,
      })
      local opts = {
        window = {
          width = 100,
        },
        plugins = {
          options = {
            ruler = true,
            laststatus = 0,
          },
          wezterm = {
            enabled = true,
            font = "18",
          },
        }
      }
      return opts
    end
  }
}
