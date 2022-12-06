vim.filetype.add {
    extension = {
        php = function(path, _)
            if string.match(path, 'templates') then
                return 'php.html'
            end

            return 'php'
        end,
    },
}
