local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'sd.lsp'
        end,
        dependencies = {
            { 'folke/neodev.nvim', opts = {} },
            { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim', opts = require 'sd.lsp.mason-lspconfig' },
        },
    },
    {
        'j-hui/fidget.nvim',
        opts = {
            window = { blend = 0 },
        },
        config = true,
        branch = 'legacy',
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require 'sd.lsp.null-ls'
        end,
    },
    {
        'jayp0521/mason-null-ls.nvim',
        config = function()
            require 'sd.lsp.mason-null-ls'
        end,
        -- after = 'null-ls.nvim',
    },

    -- LibUV in Lua vimdocs
    'nanotee/luv-vimdocs',
    -- lua docs from Lua 5.1 Ref Manual as vimdocs
    'milisims/nvim-luaref',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'tamago324/cmp-zsh',
    {
        'petertriho/cmp-git',
        dependencies = 'nvim-lua/plenary.nvim',
    },
    'davidsierradz/cmp-conventionalcommits',
    -- Adds icons for nvim-cmp
    'onsails/lspkind-nvim',

    {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'sd.cmp'
        end,
    },

    {
        'L3MON4D3/LuaSnip',
        config = function()
            require 'sd.luasnip'
        end,
    },
    'saadparwaiz1/cmp_luasnip',

    {
        'sainnhe/sonokai',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.opt.termguicolors = true
            vim.api.nvim_set_var('sonokai_diagnostic_text_highlight', 1)
            vim.api.nvim_set_var('sonokai_diagnostic_line_highlight', 1)
            vim.api.nvim_set_var('sonokai_enable_italic', 1)
            vim.api.nvim_set_var('sonokai_transparent_background', 1)
            vim.cmd [[colorscheme sonokai]]
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require 'sd.telescope'
        end,
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    { 'nvim-telescope/telescope-symbols.nvim' },

    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'sd.treesitter'
        end,
        build = ':TSUpdate',
    },

    {
        'yioneko/nvim-yati',
        dependencies = 'nvim-treesitter/nvim-treesitter',
    },

    'nvim-treesitter/playground',

    'gbprod/php-enhanced-treesitter.nvim',

    {
        'folke/which-key.nvim',
        config = function()
            require 'sd.which-key'
        end,
    },

    'tpope/vim-commentary',

    -- Adds icons to telescope
    'kyazdani42/nvim-web-devicons',

    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
        },
        config = function()
            require 'sd.neogit'
        end,
    },
    'tpope/vim-fugitive',

    -- enhances git commit mode
    'rhysd/committia.vim',

    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function(buffer)
            require 'sd/gitsigns'
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            -- opt = true,
        },
        config = function()
            require 'sd.lualine'
        end,
    },

    'editorconfig/editorconfig-vim',

    {
        'vim-test/vim-test',
        config = function()
            require 'sd.vim-test'
        end,
    },
    {
        'tpope/vim-projectionist',
        config = function()
            require 'sd.projectionist'
        end,
    },

    'markstory/vim-zoomwin',

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },

    'romainl/vim-cool',

    'Glench/Vim-Jinja2-Syntax',

    'ellisonleao/glow.nvim',

    {
        'danymat/neogen',
        config = function()
            require 'sd.neogen'
        end,
        dependencies = 'nvim-treesitter/nvim-treesitter',
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    },

    {
        'phpactor/phpactor',
        build = 'composer install --no-dev --optimize-autoloader --no-interaction',
        version = '*',
    },

    'tpope/vim-dadbod',

    'kristijanhusak/vim-dadbod-ui',

    'kristijanhusak/vim-dadbod-completion',

    {
        'mickael-menu/zk-nvim',
        config = function()
            require('zk').setup()
        end,
    },

    'theprimeagen/jvim.nvim',

    'phelipetls/jsonpath.nvim',

    {
        'folke/noice.nvim',
        config = function()
            require 'sd.noice'
        end,
        dependencies = {
            'MunifTanjim/nui.nvim',
            {
                'rcarriga/nvim-notify',
                config = function()
                    require('notify').setup { background_colour = '#000000' }
                end,
            },
        },
    },
}
