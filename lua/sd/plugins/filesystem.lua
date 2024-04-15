return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '<leader>oc',
            function()
                require('oil').open_float(vim.fn.getcwd())
            end,
            desc = 'Open Cwd (oil)',
        },
    },
    opts = {
        columns = {
            'icon',
            'permissions',
            'size',
            'mtime',
        },
    },
}
