return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'sd.cmp'
        end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'tamago324/cmp-zsh',
            { 'petertriho/cmp-git', dependencies = 'nvim-lua/plenary.nvim' },
            'davidsierradz/cmp-conventionalcommits',
            -- Adds icons for nvim-cmp
            'onsails/lspkind-nvim',
            'saadparwaiz1/cmp_luasnip',
        },
    },

    {
        'L3MON4D3/LuaSnip',
        config = function()
            require 'sd.luasnip'
        end,
        dependencies = { 'saadparwaiz1/cmp_luasnip' },
    },
}
