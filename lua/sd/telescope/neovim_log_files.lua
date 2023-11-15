vim.api.nvim_create_user_command('NeovimLogFiles', function(opts)
    local neovim_log_files = require('telescope.builtin').find_files
    neovim_log_files {
        find_command = {
            'fd',
            '--exclude=swap',
            'log',
            vim.fn.stdpath 'log',
        },
    }
end, {})
