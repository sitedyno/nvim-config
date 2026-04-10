vim.pack.add({
	'https://github.com/tpope/vim-repeat', -- leap
	'https://codeberg.org/andyg/leap.nvim',
})

-- buffers
vim.keymap.set({'n','v'}, '<localleader>p', '<cmd>bprevious<cr>', { desc = 'Previous Buffer' })
vim.keymap.set({'n','v'}, '<localleader>n', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- window navigation
vim.keymap.set({'n','v'}, '<c-h>', '<c-w>h', { desc = 'Move Left' })
vim.keymap.set({'n','v'}, '<c-j>', '<c-w>j', { desc = 'Move Down' })
vim.keymap.set({'n','v'}, '<c-k>', '<c-w>k', { desc = 'Move Up' })
vim.keymap.set({'n','v'}, '<c-l>', '<c-w>l', { desc = 'Move Right' })

-- terminals
vim.keymap.set({'t'}, '<c-h>', '<c-\\><c-n><c-w>h', { desc = 'Move Left' })
vim.keymap.set({'t'}, '<c-j>', '<c-\\><c-n><c-w>j', { desc = 'Move Down' })
vim.keymap.set({'t'}, '<c-k>', '<c-\\><c-n><c-w>k', { desc = 'Move Up' })
vim.keymap.set({'t'}, '<c-l>', '<c-\\><c-n><c-w>l', { desc = 'Move Right' })
