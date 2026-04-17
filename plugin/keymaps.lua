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

local whichkey = require('which-key')
whichkey.add({
    -- { '<leader>a', group = '' },
    -- { '<leader>A', group = '' },
    { '<leader>b', group = 'Blame' },
    -- { '<leader>B', group = '' },
    { '<leader>c', group = 'Cancel' },
    -- { '<leader>C', group = '' },
    { '<leader>d', group = 'Diff|Disable' },
    { '<leader>D', group = 'Diff' },
    { '<leader>e', group = 'Enable' },
    -- { '<leader>E', group = '' },
    { '<leader>f', group = 'Format' },
    -- { '<leader>F', group = '' },
    { '<leader>g', group = 'Git' },
    -- { '<leader>G', group = '' },
    -- { '<leader>h', group = '' },
    { '<leader>H', group = 'Hawtkeys' },
    { '<leader>i', group = 'Inline' },
    -- { '<leader>I', group = '' },
    -- { '<leader>j', group = '' },
    -- { '<leader>J', group = '' },
    -- { '<leader>k', group = '' },
    -- { '<leader>K', group = '' },
    { '<leader>l', group = 'List' },
    -- { '<leader>L', group = '' },
    { '<leader>n', group = 'Next' },
    -- { '<leader>N', group = '' },
    -- { '<leader>o', group = '' },
    -- { '<leader>O', group = '' },
    { '<leader>p', group = 'Previous' },
    { '<leader>P', group = 'Preview' },
    -- { '<leader>q', group = '' },
    -- { '<leader>Q', group = '' },
    { '<leader>r', group = 'Replace|Reset' },
    { '<leader>R', group = 'Reset' },
    { '<leader>s', group = 'Send|Source|Stage' },
    { '<leader>S', group = 'Send|Stage' },
    { '<leader>t', group = 'Toggle' },
    -- { '<leader>T', group = '' },
    { '<leader>u', group = 'Update' },
    -- { '<leader>U', group = 'Update' },
    -- { '<leader>v', group = 'Update' },
    -- { '<leader>V', group = 'Update' },
    -- { '<leader>w', group = 'Update' },
    -- { '<leader>W', group = 'Update' },
    -- { '<leader>x', group = 'Update' },
    -- { '<leader>X', group = 'Update' },
    -- { '<leader>y', group = 'Update' },
    -- { '<leader>Y', group = 'Update' },
    -- { '<leader>z', group = 'Update' },
    -- { '<leader>Z', group = 'Update' },
})

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
