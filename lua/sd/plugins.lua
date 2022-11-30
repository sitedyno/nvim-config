vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup {
    function(use)
        use { 'wbthomason/packer.nvim' }

        use {
            'williamboman/mason.nvim',
            config = [[ require('mason').setup() ]],
        }
        use {
            'williamboman/mason-lspconfig.nvim',
            config = [[ require('sd.lsp.mason-lspconfig') ]],
        }
        use {
            'neovim/nvim-lspconfig',
            config = [[ require 'sd.lsp' ]],
        }
        use {
            'j-hui/fidget.nvim',
            config = [[ require'fidget'.setup{ window = { blend = 0 } } ]],
        }
        use {
            'jose-elias-alvarez/null-ls.nvim',
            config = [[ require 'sd.lsp.null-ls' ]],
            after = 'mason.nvim',
        }
        use {
            'jayp0521/mason-null-ls.nvim',
            config = [[ require 'sd.lsp.mason-null-ls' ]],
            after = 'null-ls.nvim',
        }

        use 'folke/neodev.nvim'
        -- LibUV in Lua vimdocs
        use 'nanotee/luv-vimdocs'
        -- lua docs from Lua 5.1 Ref Manual as vimdocs
        use 'milisims/nvim-luaref'

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

        use 'gbprod/php-enhanced-treesitter.nvim'

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
            --tag = 'release'
            tag = '*', -- To use the latest 'release'
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
            tag = '*',
        }

        use 'tpope/vim-dadbod'

        use 'kristijanhusak/vim-dadbod-ui'

        use 'kristijanhusak/vim-dadbod-completion'

        use {
            'mickael-menu/zk-nvim',
            config = [[ require("zk").setup() ]],
        }

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_cmd = 'tabnew \\[packer\\]',
        },
    },
}
