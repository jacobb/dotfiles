local smart_splits = require('smart-splits')

-- go to last buffer
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

-- window nav
vim.keymap.set("n", "<Leader>v", ":vsp<cr>")
vim.keymap.set("n", "<Leader>h", ":sp<cr>")

--spell
vim.keymap.set("n", "<Leader>S", ":setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("n", "<Leader>G", ":G<cr>")

vim.keymap.set({ "n", "i", "t", "c" }, "<C-h>", smart_splits.move_cursor_left)
vim.keymap.set({ "n", "i", "t", "c" }, "<C-l>", smart_splits.move_cursor_right)
vim.keymap.set({ "n", "i", "t", "c" }, '<C-k>', smart_splits.move_cursor_up)
vim.keymap.set({ "n", "i", "t", "c" }, '<C-j>', smart_splits.move_cursor_down)

vim.keymap.set("n", '<Leader>er', "<CMD>Oil .<CR>")
vim.keymap.set("n", '<Leader>ee', "<CMD>Oil<CR>")
vim.keymap.set("n", '<Leader>ntf', "<CMD>Oil %:h<CR>")

vim.keymap.set("n", "<Leader><Enter>", "<C-]>")
vim.keymap.set("n", "<Leader><Enter>", "<C-]>")
vim.keymap.set("n", "gz", ":ZenMode<cr>")

local noremap_silent = { noremap = true, silent = true }

-- location and quickfix helpers
--
-- Helper function that works for both location and quickfix lists
local function goto_next_item(use_location_list)
    local list = use_location_list and vim.fn.getloclist(0) or vim.fn.getqflist()
    if #list == 1 then
        -- If only one item, jump directly to it
        if use_location_list then
            vim.cmd('ll 1')
        else
            vim.cmd('cc 1')
        end
        return
    end
    -- Otherwise use the standard vim-unimpaired mapping
    vim.cmd(use_location_list and 'normal! ]l' or 'normal! ]q')
end

vim.keymap.set('n', '=l', function ()
  local win = vim.api.nvim_get_current_win()
  local items = vim.fn.getloclist(win)
  if #items == 0 then
    return
  end
  local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
  local action = qf_winid > 0 and 'lclose' or 'lopen'
  vim.cmd('botright ' .. action)
end, noremap_silent)

vim.keymap.set('n', '=q', function ()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  local action = qf_winid > 0 and 'cclose' or 'copen'
  vim.cmd('botright ' .. action)
end, noremap_silent)

vim.keymap.set('n', ']l', function() goto_next_item(true) end, { noremap = true, silent = true })
vim.keymap.set('n', ']q', function() goto_next_item(false) end, { noremap = true, silent = true })
