return {
  { dir = "/Users/jacob/src/ink-nvim", name = "ink-nvim" },
  {
    "folke/zen-mode.nvim",
    ft = { "markdown", "mail", "text" },
    opts = {
      window = {
        width = 100,
      },
      plugins = {
        options = {
          ruler = true,
          laststatus = 0,
          showcmd = true,
        },
        wezterm = {
          enabled = true,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      }
    }
  }
}
