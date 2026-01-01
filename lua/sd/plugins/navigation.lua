return {
    {
        enabled = true,
        'ggandor/leap.nvim',
        config = function()
            vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
            vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
        end,
        dependencies = {
            'tpope/vim-repeat',
        },
    },
    {
        enabled = true,
        'ggandor/flit.nvim',
        config = true,
        dependencies = {
            'tpope/vim-repeat',
        },
    },
}
