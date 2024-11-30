return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = function ()
      local fzf = require("fzf-lua")
      return {
        { "<Leader>f", fzf.files },
        { "<Leader>r", fzf.grep },
        { "<Leader>R", fzf.grep_cword},
        { "<Leader>j", fzf.jumps},
      }
    end
  },
  "tpope/vim-unimpaired",
  {
    'stevearc/oil.nvim',
    opts = {
      -- Show hidden files by default
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional: load the plugin when you use a directory command
    event = "VeryLazy",
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "python", "htmldjango", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          },
        },
      })
    end
  },
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
  },
}
