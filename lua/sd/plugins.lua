-- since we marked packer as opt:
vim.cmd [[packadd packer.nvim ]]
return require('packer').startup(function()
    use {
        'wbthomason/packer.nvim',
        opt = true,
    }

    use {
        'neovim/nvim-lspconfig',
        opt = true,
        event = 'BufReadPre',
        wants = {
            'cmp-nvim-lsp',
        },
        config = function()
            require('sd.lsp')
        end,
    }

    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'onsails/lspkind-nvim'

    use {
        'hrsh7th/nvim-cmp',
--        commit = '58d081300bb941bdf14b4e6316020914019e247a',
        config = function()
            require('sd.cmp')
        end,
    }

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'sainnhe/sonokai'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use 'nvim-treesitter/playground'

    use {
        'folke/which-key.nvim',
        --config = function ()
            --require('which-key').setup {
                --popup_mappings = {
                    --scroll_down = '<c-n>',
                    --scroll_up = '<c-p>',
                --},
            --}
        --end
    }

    use 'kyazdani42/nvim-web-devicons'
end)
