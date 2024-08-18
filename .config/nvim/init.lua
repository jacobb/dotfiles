local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
require("lazy").setup("plugins")

require('nightfox').setup({
  options = {
    dim_inactive = true,
    transparent = true,
  },
  groups = {
    all = {
      -- Highlight groups are case sensitive
      htmlH2 = { fg = "palette.magenta.bright" },
      htmlH3 = { fg = "palette.orange.bright" },
      htmlH4 = { fg = "palette.green.bright" },
    }
  }
})
vim.cmd [[colorscheme nightfox]]

vim.opt.hidden = true
vim.opt.title = true

-- sidebars
vim.opt.number = true
vim.opt.colorcolumn = { 88, 120 }
vim.opt.relativenumber = true
vim.opt.conceallevel = 2


-- indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- history/swap files
vim.opt.swapfile = false

-- fzf
local fzf = require("fzf-lua")
vim.keymap.set("n", "<Leader>f", fzf.files)
vim.keymap.set("n", "<Leader>r", fzf.grep)

-- go to last buffer
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

-- experimental
vim.opt.cmdheight = 0

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("lsp")
require("status")
require("maps")
