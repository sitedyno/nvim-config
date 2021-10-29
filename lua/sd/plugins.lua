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
        config = function()
            require('sd.lsp')
        end,
    }

    use 'hrsh7th/cmp-nvim-lsp'

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- Adds icons for nvim-cmp
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

    use 'folke/which-key.nvim'

    use 'tpope/vim-commentary'

    -- Adds icons to telescope
    use 'kyazdani42/nvim-web-devicons'

    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary',
            'sindrets/diffview.nvim',
        },
        config = function ()
            require 'sd.neogit'
        end
    }
end)
