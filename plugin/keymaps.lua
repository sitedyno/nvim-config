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
local group_modes = {'n', 'v' }
whichkey.add({
    -- { '<leader>a', group = '' , mode = group_modes},
    -- { '<leader>A', group = '', mode = group_modes },
    { '<leader>b', group = 'Blame', mode = group_modes },
    -- { '<leader>B', group = '', mode = group_modes },
    { '<leader>c', group = 'Cancel|Clean', mode = group_modes },
    -- { '<leader>C', group = '', mode = group_modes },
    { '<leader>d', group = 'Diff|Disable', mode = group_modes },
    { '<leader>D', group = 'Diff', mode = group_modes },
    { '<leader>e', group = 'Enable', mode = group_modes },
    -- { '<leader>E', group = '', mode = group_modes },
    { '<leader>f', group = 'Format', mode = group_modes },
    -- { '<leader>F', group = '' , mode = group_modes},
    { '<leader>g', group = 'Git', mode = group_modes },
    -- { '<leader>G', group = '', mode = group_modes },
    -- { '<leader>h', group = '', mode = group_modes },
    { '<leader>H', group = 'Hawtkeys', mode = group_modes },
    { '<leader>i', group = 'Inline', mode = group_modes },
    -- { '<leader>I', group = '', mode = group_modes },
    -- { '<leader>j', group = '', mode = group_modes },
    -- { '<leader>J', group = '', mode = group_modes },
    -- { '<leader>k', group = '', mode = group_modes },
    -- { '<leader>K', group = '', mode = group_modes },
    { '<leader>l', group = 'List', mode = group_modes },
    -- { '<leader>L', group = '', mode = group_modes },
    { '<leader>n', group = 'Next', mode = group_modes },
    -- { '<leader>N', group = '', mode = group_modes },
    -- { '<leader>o', group = '', mode = group_modes },
    -- { '<leader>O', group = '', mode = group_modes },
    { '<leader>p', group = 'Previous', mode = group_modes },
    { '<leader>P', group = 'Preview', mode = group_modes },
    -- { '<leader>q', group = '', mode = group_modes },
    -- { '<leader>Q', group = '', mode = group_modes },
    { '<leader>r', group = 'Replace|Reset', mode = group_modes },
    { '<leader>R', group = 'Reset', mode = group_modes },
    { '<leader>s', group = 'Send|Source|Stage', mode = group_modes },
    { '<leader>S', group = 'Send|Stage', mode = group_modes },
    { '<leader>t', group = 'Toggle', mode = group_modes },
    -- { '<leader>T', group = '', mode = group_modes },
    { '<leader>u', group = 'Update', mode = group_modes },
    -- { '<leader>U', group = '', mode = group_modes },
    -- { '<leader>v', group = '', mode = group_modes },
    -- { '<leader>V', group = '', mode = group_modes },
    -- { '<leader>w', group = '', mode = group_modes },
    -- { '<leader>W', group = '', mode = group_modes },
    -- { '<leader>x', group = '', mode = group_modes },
    -- { '<leader>X', group = '', mode = group_modes },
    -- { '<leader>y', group = '', mode = group_modes },
    -- { '<leader>Y', group = '', mode = group_modes },
    -- { '<leader>z', group = '', mode = group_modes },
    -- { '<leader>Z', group = '', mode = group_modes },
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
