vim.filetype.add {
    extension = {
        php = function(path, bufnr)
            if string.match(path, 'templates') then
                -- return 'php.html'
                return 'php'
            end

            return 'php'
        end,
    },
}
