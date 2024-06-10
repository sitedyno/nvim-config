local hasts, tsconf = pcall(require, 'nvim-treesitter.configs')

if not hasts then
    print 'Failed to load treesitter'
    return
end

tsconf.setup {
    ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'html',
        'ini',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'query',
        'rasi',
        'regex',
        'scss',
        'sql',
        'twig',
        'vim',
        'vimdoc',
        'yaml',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
        -- disable html pending https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
        -- disable = { 'html' },
    },
    indent = {
        enable = true,
        disable = {
            'css',
            'html',
            'javascript',
            'json',
            'lua',
            'ansible',
        },
    },
    incremental_selection = {
        enable = true,
    },
    -- playground = {
    --     keybindings = {
    --         toggle_query_editor = 'o',
    --         toggle_hl_groups = 'i',
    --         toggle_injected_languages = 't',
    --         toggle_anonymous_nodes = 'a',
    --         toggle_language_display = 'I',
    --         focus_language = 'f',
    --         unfocus_language = 'F',
    --         update = 'R',
    --         goto_node = '<cr>',
    --         show_help = '?',
    --     },
    -- },
    yati = {
        enable = true,
    },
}
