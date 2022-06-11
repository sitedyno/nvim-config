local hasfmt, formatter = pcall(require, 'formatter')

if not hasfmt then
    print 'Failed to load formatter'
    return
end

formatter.setup {
    -- logging = true,
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        '--config-path ' .. vim.loop.cwd() .. '/stylua.toml',
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        php = {
            function()
                return {
                    exe = 'vendor/bin/phpcbf',
                    args = {
                        '--stdin-path=' .. vim.api.nvim_buf_get_name(0),
                        '-',
                    },
                    stdin = true,
                    ignore_exitcode = true,
                }
            end,
        },
    },
}

-- format on write
vim.cmd [[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.lua,*.php FormatWrite
    augroup END
]]
