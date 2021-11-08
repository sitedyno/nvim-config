vim.g.projectionist_heuristics = {
    ['bin/cake'] = {
        ['src/*.php'] = {
            alternate = 'tests/TestCase/{}Test.php',
            type = 'source',
        },
    },
}
