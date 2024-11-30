vim.g.cmp_enabled = true

return {
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',

      'l3mon4d3/luasnip',
      { dir = "/users/jacob/src/ink-nvim", name = "ink-nvim" },
    },
    config = function ()
      local cmp = require("cmp")
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        enabled = function ()
          return vim.g.cmp_enabled
        end,
        performance = {
          debounce = 60,
          throttle = 30,
          fetching_timeout = 500,
        },
        mapping = {
          ["<c-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<c-n>"] = cmp.mapping.select_next_item(cmp_select_opts),
          ["<c-;>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<c-e>"] = cmp.mapping.abort(),
          ["<c-u>"] = cmp.mapping.scroll_docs(-4),
          ["<c-d>"] = cmp.mapping.scroll_docs(4),
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
          autocomplete = {
            cmp.TriggerEvent.TextChanged,
            cmp.TriggerEvent.InsertEnter,
          },
          keyword_length = 3,
        },
        experimental = {
          ghost_text = true,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", max_item_count = 5 },
          { name = "buffer",   keyword_length = false, max_item_count = 5 },
          { name = "path" },
          {
            name = 'ink',
            keyword_length = 2,
          },
        }),
      })
    end
  }
}
