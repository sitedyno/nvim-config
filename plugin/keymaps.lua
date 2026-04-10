vim.pack.add {
    'https://github.com/folke/which-key.nvim',
    'https://github.com/nvim-lua/plenary.nvim', -- hawtkeys
    'https://github.com/sitedyno/hawtkeys.nvim',
}

require('hawtkeys').setup {
    leader = ',',
    powerFingers = { 2, 3, 4, 7, 8, 9 },
    keyboardLayout = 'qwertyortho',
}

vim.keymap.set({ 'n', 'v' }, '<leader>Hs', '<cmd>Hawtkeys<cr>', { desc = 'Hawtkeys Search' })
vim.keymap.set({ 'n', 'v' }, '<leader>Hd', '<cmd>HawtkeysDupes<cr>', { desc = 'Hawtkeys find Duplicates' })
vim.keymap.set({ 'n', 'v' }, '<leader>Ha', '<cmd>HawtkeysAll<cr>', { desc = 'Hawtkeys find Duplicates' })
