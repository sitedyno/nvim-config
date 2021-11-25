local hasts, ts = pcall(require, 'telescope')

if not hasts then
    print 'Failed to load telescope'
    return
end

ts.setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    extensions = {
        'fzf',
    },
    pickers = {
        buffers = {
            sort_lastused = true,
        },
        find_files = {
            find_command = {
                'fd',
                '-E=.git',
                '--hidden',
                '--no-ignore',
            },
        },
    },
}

ts.load_extension 'fzf'
