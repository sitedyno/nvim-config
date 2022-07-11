vim.g.projectionist_heuristics = {
    ['tests/TestCase/&src/'] = {
        ['src/*.php'] = {
            alternate = 'tests/TestCase/{}Test.php',
            type = 'source',
        },
        ['tests/TestCase/*Test.php'] = {
            alternate = 'src/{}.php',
            type = 'test',
        },
    },
}
