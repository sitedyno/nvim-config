-- since we marked packer as opt:
vim.cmd [[packadd packer.nvim ]]

-- shush LSP
local use = require('packer').use

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }

    use {
        'neovim/nvim-lspconfig',
        opt = false,
        event = 'BufReadPre',
        config = function()
            require 'sd.lsp'
        end,
    }

    use 'williamboman/nvim-lsp-installer'

    use 'folke/lua-dev.nvim'

    use 'mhartington/formatter.nvim'

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
            require 'sd.cmp'
        end,
    }

    use 'ray-x/lsp_signature.nvim'

    use 'hrsh7th/cmp-vsnip'
    use {
        'hrsh7th/vim-vsnip',
        config = function()
            require 'sd.vsnip'
        end,
    }
    use 'sainnhe/sonokai'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
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
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },
        config = function()
            require 'sd.neogit'
        end,
    }

    -- enhances git commit mode
    use 'rhysd/committia.vim'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        tag = 'release', -- To use the latest release
        config = function()
            require 'sd.gitsigns'
        end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
        },
        config = function()
            require 'sd.lualine'
        end,
    }

    use 'editorconfig/editorconfig-vim'

    use 'vim-test/vim-test'
    use 'tpope/vim-projectionist'

    use 'markstory/vim-zoomwin'

    use 'norcalli/nvim-colorizer.lua'
end)
