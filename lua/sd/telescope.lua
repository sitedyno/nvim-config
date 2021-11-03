local hasts, ts = pcall(require, 'telescope')

if not hasts then
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
    },
}

ts.load_extension('fzf')
