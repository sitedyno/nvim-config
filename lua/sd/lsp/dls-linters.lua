local linters = {
    phpcs = {
        command = 'vendor/bin/phpcs',
        sourceName = 'phpcs',
        debounce = 300,
        rootPatterns = {
            'composer.lock',
            'vendor',
            '.git',
        },
        args = {
            '--report=json',
            '--stdin-path=%filepath',
            '-s',
            '-',
        },
        parseJson = {
            errorsRoot = 'files.["%filepath"].messages',
            line = 'line',
            column = 'column',
            endLine = 'line',
            endColumn = 'column',
            message = '[phpcs] ${message} [${source}]',
            security = 'type',
        },
        securities = {
            error = 'error',
            warning = 'warning',
        },
        requiredFiles = { 'vendor/bin/phpcs' },
    },
    psalm = {
        command = './vendor/bin/psalm',
        sourceName = 'psalm',
        debounce = 100,
        rootPatterns = { 'composer.lock', 'vendor', '.git' },
        args = { '--output-format=emacs', '--no-progress' },
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
        formatPattern = {
            '^(.*):(\\d+):(\\d+):(.*)\\s-\\s(.*)$',
            {
                sourceName = 1,
                sourceNameFilter = true,
                line = 2,
                column = 3,
                message = 5,
                security = 4,
            },
        },
        securities = {
            error = 'error',
            warning = 'warning',
        },
        requiredFiles = { 'vendor/bin/psalm' },
    },
}

return linters
