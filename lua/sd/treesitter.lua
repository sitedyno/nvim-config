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
        'php',
        'phpdoc',
        'regex',
        'scss',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        -- disable html pending https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
        disable = { 'html' },
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
    },
    yati = {
        enable = true,
    },
}
