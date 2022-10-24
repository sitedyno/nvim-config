require('mason-null-ls').setup {
    automatic_installation = {
        exclude = {
            'phpcbf',
            'phpcs',
            'psalm',
        },
    },
}
