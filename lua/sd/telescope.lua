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
                '--exclude=.git',
                '--hidden',
                '--no-ignore',
                '--type=file',
                '--type=symlink',
            },
        },
        live_grep = {
            on_input_filter_cb = function(prompt)
                -- AND operator for live_grep like how fzf handles spaces with wildcards in rg return
                return { prompt = prompt:gsub('%s', '.*') }
            end,
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--no-ignore',
                '--hidden',
                '--glob',
                '!.git',
            },
        },
    },
}

ts.load_extension 'fzf'
