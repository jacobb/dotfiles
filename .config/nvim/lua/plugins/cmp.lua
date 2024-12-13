vim.g.cmp_enabled = true

return {
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter", -- Lazy load on insert
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      { dir = "/users/jacob/src/ink-nvim", name = "ink-nvim" },
    },
    opts = function ()
      local cmp = require("cmp")
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

      local options = {
        enabled = function ()
          return vim.g.cmp_enabled
        end,
        performance = {
          debounce = 60,
          throttle = 30,
          fetching_timeout = 500,
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function (entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "LSP",
              buffer = "Buffer",
              path = "Path",
              ink = "Ink",
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = {
          ["<c-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<c-n>"] = cmp.mapping.select_next_item(cmp_select_opts),
          ["<Tab>"] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping(function (fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ select = false })
            else
              fallback()
            end
          end
          , { "i" }),
          ["<c-g>"] = cmp.mapping({
            i = function (fallback)
              if not cmp.visible() then
                fallback()
              end
              cmp.abort()
            end
          }),
        },
        completion = {
          completeopt = "menu,menuone,noselect",
          autocomplete = {
            cmp.TriggerEvent.TextChanged,
          },
          keyword_length = 2,
        },
        experimental = {
          ghost_text = true,
        },
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            max_item_count = 5,
            priority = 1000,
            keyword_length = 2,
            entry_filter = function (_)
              -- Skip LSP completion when inside strings or comments
              local context = require('cmp.config.context')
              return not context.in_treesitter_capture('string') and
                not context.in_treesitter_capture('comment')
            end
          },
          {
            name = "buffer",
            max_item_count = 5,
            priority = 500,
            keyword_length = 3, -- buffer completion needs more chars to be useful
          },
          {
            name = "path",
            priority = 250,
            keyword_length = 3,
            option = {
              trailing_slash = true, -- add trailing slash after directory names
            }
          },
          {
            name = 'ink',
            keyword_length = 2,
            priority = 750, -- high priority but below LSP
          },
        })

      }
      return options
    end
  }
}
