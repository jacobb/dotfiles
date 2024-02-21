local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("lazy").setup("plugins")

vim.opt.hidden = true

vim.opt.title = true
vim.opt.termguicolors = true

require("tokyonight").setup({
    style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
})
vim.cmd [[colorscheme gruvbox-material]]
vim.cmd("autocmd BufEnter * set indentexpr=")

-- vim.cmd [[colorscheme tokyonight]]

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

-- fzf
vim.keymap.set("n", "<Leader>f", ":Files .<cr>")

-- go to last buffer
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

-- experimental
vim.opt.cmdheight = 0

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("lsp")
require("status")
require("maps")

--[[
--## plugins we know we want:
--fzf
--vim-fugitive
--vim-unimpaired
--vim-tmux-navigator
--vim-repeat
--vim-surround (gosh darnit, Tim, calm down)

--## pretty sure
--vim-devicons
--polygot [ugh]
--vim-cool
--gruvbox-material
--tokyonight.nvim
--goyo
--vim-pencil

--## for now
--obsidian.nvim
--nvim-cmp
--
--## to research
--status line (Kinda want to write my own I think)
--our own colorscheme
--lsp stuff [cmp maybe worth it?]
--ui stuff
--thing to dim/brighten current pane
--]]
--
