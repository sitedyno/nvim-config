vim.pack.add {
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-tree/nvim-web-devicons',
}

require('nvim-web-devicons').setup()
---@diagnostic disable-line: assign-type-mismatch
require('fzf-lua').setup { 'ivy', 'hide' }

vim.keymap.set({ 'n', 'v' }, '<localleader>f', '<cmd>FzfLua global<cr>', { desc = 'Find Files' })
vim.keymap.set({ 'n', 'v' }, '<localleader>b', '<cmd>FzfLua buffers<cr>', { desc = 'Buffers' })
vim.keymap.set({ 'n', 'v' }, '<localleader>g', '<cmd>FzfLua live_grep<cr>', { desc = 'Grep' })
vim.keymap.set({ 'n', 'v' }, '<leader>gs', '<cmd>FzfLua git_status<cr>', { desc = 'Git Status' })
