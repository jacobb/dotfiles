local smart_splits = require('smart-splits')

-- window nav
vim.keymap.set("n", "<Leader>v", ":vsp<cr>")
vim.keymap.set("n", "<Leader>h", ":sp<cr>")

--spell
vim.keymap.set("n", "<Leader>S", ":setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("n", "<Leader>G", ":G<cr>")

vim.keymap.set({"n", "i", "t", "c"}, "<C-h>", smart_splits.move_cursor_left)
vim.keymap.set({"n", "i", "t", "c"}, "<C-l>", smart_splits.move_cursor_right)
vim.keymap.set({"n", "i", "t", "c"}, '<C-k>', smart_splits.move_cursor_up)
vim.keymap.set({"n", "i", "t", "c"}, '<C-j>', smart_splits.move_cursor_down)

vim.keymap.set("n", '<Leader>er', ":Explore .<cr><cr>")
vim.keymap.set("n", '<Leader>ee', ":Explore <cr>")
vim.keymap.set("n", '<Leader>ntf', ":Lexplore %:h<cr>")

vim.keymap.set("n", "<Leader><Enter>", "<C-]>")
