return {
    {
        enabled = true,
        'ggandor/leap.nvim',
        config = function()
            require('leap').create_default_mappings()
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
