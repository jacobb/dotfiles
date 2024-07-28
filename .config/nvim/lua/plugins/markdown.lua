return {
  { dir = "/Users/jacob/src/ink-nvim", name = "ink-nvim" },
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
