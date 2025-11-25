local hasts, ts = pcall(require, 'telescope')

if not hasts then
    print 'Failed to load telescope'
    return
end

ts.setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    pickers = {
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ['<C-x>'] = 'delete_buffer',
                },
            },
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
ts.load_extension 'notify'
ts.load_extension 'noice'
ts.load_extension 'helpgrep'
ts.load_extension 'dir'
ts.load_extension 'ui-select'
ts.load_extension 'yadm_files'
ts.load_extension 'git_or_files'
ts.load_extension 'git_or_yadm_files'
