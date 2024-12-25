return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = function ()
      local fzf = require("fzf-lua")
      return {
        { "<Leader>f", fzf.files },
        { "<Leader>r", fzf.grep },
        { "<Leader>R", fzf.grep_cword },
        { "<Leader>j", fzf.jumps },
      }
    end
  },
  "tpope/vim-unimpaired",
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    },
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
        ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "python", "htmldjango", "javascript", "html", "yaml", "toml"},
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true , disable = {"python"}},
        autopairs = {
          enable = true,
        },
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
