return {
  "junegunn/fzf",
  "junegunn/fzf.vim",
  --[[
    {
        'sheerun/vim-polyglot',
        lazy = false,
    },
    ]] --
  "tpope/vim-unimpaired",
  "tpope/vim-vinegar",
  "neovim/nvim-lspconfig",
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
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}
