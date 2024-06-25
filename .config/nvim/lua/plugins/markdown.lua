return {
  --[[
  {
    "epwalsh/obsidian.nvim",
    version = "*",     -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/notes/**.md"
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      follow_url_func = function (url)
        vim.fn.jobstart({ "open", url })
      end,
      disable_frontmatter = true,
      note_id_func = function (title)
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return suffix
      end,
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 3,
      },
      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        },
      },
    },
  },
  --]]
  {
    "preservim/vim-markdown",
    init = function ()
      vim.g['vim_markdown_conceal_code_blocks'] = false
      vim.g['vim_markdown_frontmatter'] = true
      vim.g['vim_markdown_strikethrough'] = false
      vim.g['vim_markdown_folding_disabled'] = true
    end,
  },
  {
    "preservim/vim-pencil",
    config = function ()
      vim.api.nvim_call_function("pencil#init", {})
    end,
    init = function ()
      vim.g['pencil#conceallevel'] = 2
      vim.g['pencil#wrapModeDefault'] = "soft"
    end,
    ft = { "markdown", "text", "email" }
  },
}
