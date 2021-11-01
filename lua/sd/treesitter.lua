local hasts, tsconf = pcall(require, 'nvim-treesitter.configs')

if not hasts then
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
        'regex',
        'scss',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
    },
}
