-- since we marked packer as opt:
vim.cmd [[packadd packer.nvim ]]

-- shush LSP
local use = require('packer').use

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }

    use {
        'williamboman/nvim-lsp-installer',
        {
            'neovim/nvim-lspconfig',
            config = function()
                require('nvim-lsp-installer').setup {}
                require 'sd.lsp'
            end,
        },
    }

    use 'folke/lua-dev.nvim'
    -- LibUV in Lua vimdocs
    use 'nanotee/luv-vimdocs'
    -- lua docs from Lua 5.1 Ref Manual as vimdocs
    use 'milisims/nvim-luaref'

    use 'mhartington/formatter.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    -- seems glitchy w/ luasnip, formatting fails for me, shows raw md
    -- use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'tamago324/cmp-zsh'
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

    -- use 'hrsh7th/cmp-vsnip'
    -- use {
    --     'hrsh7th/vim-vsnip',
    --     config = function()
    --         require 'sd.vsnip'
    --     end,
    -- }

    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

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

    use 'romainl/vim-cool'

    use 'Glench/Vim-Jinja2-Syntax'

    use 'ellisonleao/glow.nvim'

    use {
        'phpactor/phpactor',
        run = 'composer install --no-dev --optimize-autoloader --no-interaction',
    }
end)
