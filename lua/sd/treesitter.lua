require 'nvim-treesitter.configs'.setup {
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
}
