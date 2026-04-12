vim.pack.add {
    'https://github.com/tpope/vim-repeat', -- leap
    'https://codeberg.org/andyg/leap.nvim',
}

-- buffers
vim.keymap.set({ 'n', 'v' }, '<localleader>p', '<cmd>bprevious<cr>', { desc = 'Previous Buffer' })
vim.keymap.set({ 'n', 'v' }, '<localleader>n', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- window navigation
vim.keymap.set({ 'n', 'v' }, '<c-h>', '<c-w>h', { desc = 'Move Left' })
vim.keymap.set({ 'n', 'v' }, '<c-j>', '<c-w>j', { desc = 'Move Down' })
vim.keymap.set({ 'n', 'v' }, '<c-k>', '<c-w>k', { desc = 'Move Up' })
vim.keymap.set({ 'n', 'v' }, '<c-l>', '<c-w>l', { desc = 'Move Right' })

-- terminals
vim.keymap.set({ 't' }, '<c-h>', '<c-\\><c-n><c-w>h', { desc = 'Move Left' })
vim.keymap.set({ 't' }, '<c-j>', '<c-\\><c-n><c-w>j', { desc = 'Move Down' })
vim.keymap.set({ 't' }, '<c-k>', '<c-\\><c-n><c-w>k', { desc = 'Move Up' })
vim.keymap.set({ 't' }, '<c-l>', '<c-\\><c-n><c-w>l', { desc = 'Move Right' })

-- https://github.com/radleylewis/nvim-lite/
-- better movement in wrapped text
vim.keymap.set("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
    return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
