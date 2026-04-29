vim.pack.add {
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-tree/nvim-web-devicons',
}

require('nvim-web-devicons').setup()
---@diagnostic disable-next-line: assign-type-mismatch
require('fzf-lua').setup { 'ivy', 'hide' }

local function all_files()
    require('fzf-lua').files({
        fd_opts = [[--color=never --type f --type l --hidden --no-ignore]],
    })
end

vim.keymap.set({ 'n', 'v' }, '<localleader>a', all_files, { desc = 'All files' })
vim.keymap.set({ 'n', 'v' }, '<localleader>b', '<cmd>FzfLua buffers<cr>', { desc = 'Buffers' })
vim.keymap.set({ 'n', 'v' }, '<localleader>f', '<cmd>FzfLua files<cr>', { desc = 'Find Files' })
vim.keymap.set({ 'n', 'v' }, '<localleader>g', '<cmd>FzfLua live_grep<cr>', { desc = 'Grep' })
vim.keymap.set({ 'n', 'v' }, '<leader>gs', '<cmd>FzfLua git_status<cr>', { desc = 'Git Status' })
