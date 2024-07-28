return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "tpope/vim-unimpaired",
  "tpope/vim-vinegar",
  { "nvim-treesitter/nvim-treesitter", tag = 'v0.9.2' },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    tag = 'v0.9.2',
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "python", "htmldjango", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  -- "neovim/nvim-lspconfig",
  { dir = "~/src/nvim-lspconfig" },
  -- "dhruvmanila/nvim-lspconfig",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 999,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 999,
  },
  "folke/tokyonight.nvim",
  "isobit/vim-caddyfile",
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      on_open = function ()
        -- lualine.hide({})
        -- vim.o.statusline = ""
        vim.o.cmdheight = 1
      end,
      on_close = function ()
        vim.o.cmdheight = 0
        -- lualine.hide({ unhide = true })
      end,
      plugins = {
        options = {
          ruler = false,
          laststatus = 1,
          showcmd = false,
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
