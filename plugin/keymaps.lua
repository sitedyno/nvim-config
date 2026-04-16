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
vim.keymap.set({ 'n', 'v' }, '<leader>Ha', '<cmd>HawtkeysAll<cr>', { desc = 'Hawtkeys All keymaps' })
vim.keymap.set({ 'n', 'v' }, '<leader>cs', '<cmd>nohlsearch<cr>', { desc = 'Cancel Search highlights' })
vim.keymap.set({ 'n', 'v' }, '<leader>cw', '<cmd>q<cr>', { desc = 'Close window' })
vim.keymap.set({ 'n', 'v' }, '<leader>sf', '<cmd>source %<cr>', { desc = 'Source current File' })
vim.keymap.set({ 'n', 'v' }, '<leader>lk', '<cmd>FzfLua keymaps<cr>', { desc = 'List Keymaps' })
vim.keymap.set({ 'n', 'v' }, 'q', '', { noremap = true, silent = true, desc = 'Begone!' })
vim.keymap.set(
    { 'n', 'v' },
    '<leader>rm',
    'q',
    { noremap = true, silent = true, desc = 'Record Macro (again to leave)' }
)

vim.keymap.set({ 'n', 'v' }, '<localleader>R', '<cmd>restart<cr>', { desc = 'Restart neovim' })
