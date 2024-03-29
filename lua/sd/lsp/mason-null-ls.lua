require('mason-null-ls').setup {
    automatic_installation = {
        -- 'ansiblelint', -- not enabled
        'curlylint',
        'djlint',
        'editorconfig_checker',
        exclude = {
            'phpcbf',
            'phpcs',
            'psalm',
        },
        'gitlint',
        'hadolint',
        'prettier',
        'shellcheck',
        'shfmt',
        'sqlfluff',
        'zsh',
    },
    -- automatic_setup = true,
    methods = {
        diagnostics = true,
        formatting = false,
        code_actions = true,
        completion = true,
        hover = true,
    },
}
