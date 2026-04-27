vim.pack.add {
    'https://github.com/tpope/vim-repeat', -- leap
    'https://codeberg.org/andyg/leap.nvim',
    'https://github.com/markstory/vim-zoomwin',
}

local function flit(key_specific_args)
    require('leap').leap(vim.tbl_deep_extend('keep', key_specific_args, {
        inputlen = 1,
        inclusive = true,
        opts = {
            -- Force autojump.
            labels = '',
            -- Match the modes where you don't need labels (`:h mode()`).
            safe_labels = vim.fn.mode(1):match 'o' and '' or nil,
        },
    }))
end

-- A helper function making it easier to set "clever-f" behavior
-- (using f/F or t/T instead of ;/, - see the plugin clever-f.vim).
local clever = require('leap.user').with_traversal_keys
local clever_f, clever_t = clever('f', 'F'), clever('t', 'T')

-- For relative directions, set the `backward` flags according to:
-- local prev_backward = require('leap').state['repeat'].backward
vim.keymap.set({ 'n', 'x', 'o' }, 'f', function()
    flit { opts = clever_f }
end)
vim.keymap.set({ 'n', 'x', 'o' }, 'F', function()
    flit { backward = true, opts = clever_f }
end)
vim.keymap.set({ 'n', 'x', 'o' }, 't', function()
    flit { offset = -1, opts = clever_t }
end)
vim.keymap.set({ 'n', 'x', 'o' }, 'T', function()
    flit { backward = true, offset = 1, opts = clever_t }
end)
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)', { desc = 'Type 2 characters of your search' })
vim.keymap.set({ 'n' }, 'S', '<Plug>(leap-from-window)', { desc = 'Type 2 characters of your search' })
vim.keymap.set({ 'n', 'x', 'o' }, '<cr>', function()
    require('leap').leap { ['repeat'] = true, opts = clever('<cr>', '<bs>') }
end)
vim.keymap.set({ 'n', 'x', 'o' }, '<bs>', function()
    require('leap').leap { ['repeat'] = true, opts = clever('<bs>', '<cr>'), backward = true }
end)

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

-- quickfix
vim.keymap.set({ 'n' }, '<leader>nq', '<cmd>cnext<cr>', { desc = 'Next Quickfix item' })
vim.keymap.set({ 'n' }, '<leader>pq', '<cmd>cprev<cr>', { desc = 'Previous Quickfix item' })
vim.keymap.set({ 'n' }, '<leader>cq', '<cmd>cclose<cr>', { desc = 'Close Quickfix item' })

-- https://github.com/radleylewis/nvim-lite/
-- better movement in wrapped text
vim.keymap.set('n', 'j', function()
    vim.cmd([[nohlsearch]])
    return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true, silent = true, desc = 'Down (wrap-aware)' })
vim.keymap.set('n', 'k', function()
    vim.cmd([[nohlsearch]])
    return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true, silent = true, desc = 'Up (wrap-aware)' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
vim.keymap.set({ 'n', 'v' }, '<localleader>z', '<cmd>ZoomToggle<cr>', { desc = 'Toggle Zoom' })
