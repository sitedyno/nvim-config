return {
    {
        'sainnhe/sonokai',
        enabled = true,
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.opt.termguicolors = true
            vim.api.nvim_set_var('sonokai_diagnostic_text_highlight', 1)
            vim.api.nvim_set_var('sonokai_diagnostic_line_highlight', 1)
            vim.api.nvim_set_var('sonokai_enable_italic', 1)
            vim.api.nvim_set_var('sonokai_transparent_background', 1)
            vim.cmd.colorscheme 'sonokai'
        end,
    },

    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'sd.lsp'
        end,
        dependencies = {
            { 'folke/neodev.nvim', opts = {} },
            { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim', opts = require 'sd.lsp.mason-lspconfig' },
            {
                'j-hui/fidget.nvim',
                opts = {
                    window = { blend = 0 },
                },
                config = true,
                branch = 'legacy',
            },
        },
    },

    -- LibUV in Lua vimdocs
    'nanotee/luv-vimdocs',
    -- lua docs from Lua 5.1 Ref Manual as vimdocs
    'milisims/nvim-luaref',

    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require 'sd.telescope'
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            'princejoogie/dir-telescope.nvim',
            {
                'catgoose/telescope-helpgrep.nvim',
                -- branch = 'sitedyno',
            },
            'pschmitt/telescope-yadm.nvim',
            -- Adds icons to telescope
            'kyazdani42/nvim-web-devicons',
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'sd.treesitter'
        end,
        dependencies = {
            { 'yioneko/nvim-yati', dependencies = 'nvim-treesitter/nvim-treesitter' },
            'nvim-treesitter/nvim-treesitter-context',
            'gbprod/php-enhanced-treesitter.nvim',
        },
    },

    {
        'folke/which-key.nvim',
        config = function()
            require 'sd.which-key'
        end,
    },

    'tpope/vim-commentary',

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
        config = function()
            require 'sd/gitsigns'
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
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

    {
        'markstory/vim-zoomwin',
        keys = {
            { '<space>z', '<cmd>ZoomToggle<cr>', desc = 'Toggle Zoom' },
        },
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },

    'romainl/vim-cool',

    'Glench/Vim-Jinja2-Syntax',

    {
        'ellisonleao/glow.nvim',
        config = true,
        cmd = 'Glow',
        keys = {
            { '<leader>rm', '<cmd>Glow<cr>', desc = 'Render Markdown' },
        },
    },

    {
        'danymat/neogen',
        config = function()
            require 'sd.neogen'
        end,
        dependencies = 'nvim-treesitter/nvim-treesitter',
        version = '*',
    },

    {
        'phpactor/phpactor',
        build = 'composer install --no-dev --optimize-autoloader --no-interaction',
        version = '*',
    },

    {
        'gbprod/phpactor.nvim',
        opts = {
            install = {
                path = vim.fn.stdpath 'data' .. '/mason/packages/phpactor/',
                bin = vim.fn.stdpath 'data' .. '/mason/packages/phpactor/phpactor',
            },
            lspconfig = {
                enabled = false,
            },
        },
    },

    'tpope/vim-dadbod',

    'kristijanhusak/vim-dadbod-ui',

    'kristijanhusak/vim-dadbod-completion',

    {
        'mickael-menu/zk-nvim',
        config = true,
        name = 'zk',
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
                opts = {
                    background_colour = '#000000',
                    stages = 'static',
                },
            },
        },
        keys = {
            { '<space>N', '<cmd>Telescope Noice<cr>', desc = 'Noice Messages' },
        },
    },

    {
        'lalitmee/browse.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        keys = {
            {
                '<leader>sb',
                function()
                    require('browse').browse()
                end,
                desc = 'Choose Search',
            },
            {
                '<leader>sd',
                function()
                    require('browse').devdocs.search()
                end,
                desc = 'Search Devdocs',
            },
            {
                '<space>sm',
                function()
                    -- local cmd = require('browse.utils').get_open_cmd()
                    local word = vim.fn.expand '<cword>'
                    local search = string.format('https://developer.mozilla.org/en-US/search?q=%s', word)
                    require('browse.utils').default_search(search)
                end,
                desc = 'Search MDN',
            },
        },
        opts = {
            provider = 'duckduckgo',
            bookmarks = {
                'https://developer.mozilla.org/en-US/search?q=%s',
            },
        },
    },

    { 'tpope/vim-repeat' },

    {
        'Kohei-Wada/yadm-git.nvim',
        lazy = false,
        opts = {
            debug = false,
        },
    },

    {
        'tris203/hawtkeys.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = {
            -- an empty table will work for default config
            --- if you use functions, or whichkey, or lazy to map keys
            --- then please see the API below for options
        },
        keys = {
            { '<leader>sh', '<cmd>Hawtkeys<cr>', desc = 'Search Hawtkeys' },
            { '<leader>lh', '<cmd>HawtkeysAll<cr>', desc = 'List Hawtkeys' },
            { '<leader>ld', '<cmd>HawtkeysDupes<cr>', desc = 'List Duplicate Hawtkeys' },
        },
    },
    {
        "fladson/vim-kitty",
        ft = "kitty",
        -- tag = "*"  -- You can select a tagged version
    },
    {
        'mikesmithgh/kitty-scrollback.nvim',
        enabled = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
        event = { 'User KittyScrollbackLaunch' },
        -- version = '*', -- latest stable version, may have breaking changes if major version changed
        -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
        config = function()
            require('kitty-scrollback').setup()
        end,
    },
}
