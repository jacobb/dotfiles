vim.api.nvim_create_autocmd("FileType", {
  pattern = { "htmldjango", "jinja.html" },
  callback = function ()
    vim.keymap.set('n', '<Leader>F', function ()
      vim.lsp.buf.format()
      vim.fn.system('djade ' .. vim.fn.expand('%'))
      vim.cmd('edit!')
    end, { buffer = true })     -- buffer = true makes it local to this buffer
  end,
})
