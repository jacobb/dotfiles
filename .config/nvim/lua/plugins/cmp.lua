-- ... rest of your mappings
--

vim.g.cmp_enabled = true

return {
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',

      'L3MON4D3/LuaSnip',
    },
    config = function ()
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        enabled = function ()
          return vim.g.cmp_enabled
        end,
        performance = { trigger_debounce_time = 500, throttle = 550, fetching_timeout = 80, },
        snippet = {
          expand = function (args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<C-n>"] = cmp.mapping(function ()
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              else
                cmp.select_next_item(cmp_select_opts)
              end
            else
              cmp.complete({ reason = cmp.ContextReason.Auto })
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              end
            end
          end, { "i", "s" }),
          ["<C-l>"] = cmp.mapping(cmp.mapping.complete({
            reason = cmp.ContextReason.Auto,
          }), { "i", "c" }),
          ["<Enter>"] = cmp.mapping(cmp.mapping.confirm(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        },
        preselect = "item",
        completion = {
          completeopt = "menu,menuone,noinsert",
          autocomplete = false,
        },
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            max_item_count = 5,
            option = {
              markdown_oxide = {
                keyword_pattern = [[\(\k\| \|\/\|#\)\+]]
              }
            }
          },
          { name = "buffer", keyword_length = 3, max_item_count = 5 },
          { name = "path" },
        }, {
        }),
      })
    end
  }
}
