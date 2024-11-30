return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = true },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function ()
      local diagnostics_message = require("status").diagnostics_message
      local opts = {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 }, diagnostics_message },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "fzf" }
      }
      return opts
    end
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 999,
    config = function (_, opts)
      require("nightfox").setup(opts)
      vim.cmd("colorscheme nightfox")
    end,
    opts = {
      options = {
        dim_inactive = true,
        transparent = true,
      },
      groups = {
        all = {
          htmlH2 = { fg = "palette.magenta.bright" },
          htmlH3 = { fg = "palette.orange.bright" },
          htmlH4 = { fg = "palette.green.bright" },
          ["@markup.heading.1.markdown"] = { fg = "palette.green.bright" },
          ["@text.title.1"] = { fg = "palette.red.bright" },
          ["@text.title.2"] = { fg = "palette.blue.bright" },
          ["@text.title.3"] = { fg = "palette.cyan.bright" },
          ["@text.title.4"] = { fg = "palette.orange.bright" },
          ["@text.title.5"] = { fg = "palette.pink.bright" },
        }
      }
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}