vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local packer_bootstrap = nil
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path, false, false)) > 0 then
    packer_bootstrap = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
end

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use {
        'williamboman/nvim-lsp-installer',
        {
            'neovim/nvim-lspconfig',
            config = [[ require 'sd.lsp' ]],
        },
        {
            'j-hui/fidget.nvim',
            config = [[ require"fidget".setup{ window = { blend = 0 } } ]],
        },
    }

    use 'folke/lua-dev.nvim'
    -- LibUV in Lua vimdocs
    use 'nanotee/luv-vimdocs'
    -- lua docs from Lua 5.1 Ref Manual as vimdocs
    use 'milisims/nvim-luaref'

    use {
        'mhartington/formatter.nvim',
        config = [[ require 'sd.formatter' ]],
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'tamago324/cmp-zsh'
    use {
        'petertriho/cmp-git',
        requires = 'nvim-lua/plenary.nvim',
    }
    use 'davidsierradz/cmp-conventionalcommits'
    -- Adds icons for nvim-cmp
    use 'onsails/lspkind-nvim'

    use {
        'hrsh7th/nvim-cmp',
        config = [[ require 'sd.cmp' ]],
    }

    use {
        'L3MON4D3/LuaSnip',
        config = [[ require 'sd.luasnip' ]],
    }
    use 'saadparwaiz1/cmp_luasnip'

    use 'sainnhe/sonokai'

    use {
        'nvim-telescope/telescope.nvim',
        config = [[ require 'sd.telescope' ]],
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[ require 'sd.treesitter' ]],
        run = ':TSUpdate',
    }

    use {
        'yioneko/nvim-yati',
        requires = 'nvim-treesitter/nvim-treesitter',
    }

    use 'nvim-treesitter/playground'

    use {
        'folke/which-key.nvim',
        config = [[ require'sd.which-key' ]],
    }

    use 'tpope/vim-commentary'

    -- Adds icons to telescope
    use 'kyazdani42/nvim-web-devicons'

    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },
        config = [[ require 'sd.neogit' ]],
    }
    use 'tpope/vim-fugitive'

    -- enhances git commit mode
    use 'rhysd/committia.vim'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        tag = 'release', -- To use the latest release
        config = [[ require 'sd.gitsigns' ]],
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true,
        },
        config = [[ require 'sd.lualine' ]],
    }

    use 'editorconfig/editorconfig-vim'

    use {
        'vim-test/vim-test',
        config = [[ require 'sd.vim-test' ]],
    }
    use {
        'tpope/vim-projectionist',
        config = [[ require 'sd.projectionist' ]],
    }

    use 'markstory/vim-zoomwin'

    use {
        'norcalli/nvim-colorizer.lua',
        config = [[ require('colorizer').setup() ]],
    }

    use 'romainl/vim-cool'

    use 'Glench/Vim-Jinja2-Syntax'

    use 'ellisonleao/glow.nvim'

    use {
        'danymat/neogen',
        config = [[ require('sd.neogen') ]],
        requires = 'nvim-treesitter/nvim-treesitter',
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    use {
        'phpactor/phpactor',
        run = 'composer install --no-dev --optimize-autoloader --no-interaction',
    }

    use 'tpope/vim-dadbod'

    use 'kristijanhusak/vim-dadbod-ui'

    use 'kristijanhusak/vim-dadbod-completion'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
