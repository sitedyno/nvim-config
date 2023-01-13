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
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'rasi',
        'regex',
        'scss',
        'sql',
        'twig',
        'vim',
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
            'json',
            'lua',
        },
    },
    incremental_selection = {
        enable = true,
    },
    yati = {
        enable = true,
    },
}
