return {
    'stevearc/conform.nvim',
    enabled = true,
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>=', -- ,=
            function()
                require('conform').format { async = true, lsp_fallback = false }
            end,
            desc = 'Format buffer',
            mode = '',
        },
        {
            '<leader>df',
            '<cmd>FormatDisable<cr>',
            desc = 'Disable Formatting',
            mode = 'n',
        },
        {
            '<leader>ef',
            '<cmd>FormatEnable<cr>',
            desc = 'Enable Formatting',
            mode = 'n',
        },
    },
    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            bash = { 'shfmt' },
            css = { 'prettier' },
            json = { 'prettier' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            lua = { 'stylua' },
            markdown = { 'prettier' },
            php = { 'phpcbf' },
            sh = { 'shfmt' },
            sql = { 'sqlfluff' },
            zsh = { 'shfmt' },
        },
        -- Set up format-on-save
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_fallback = true }
        end,
        -- Customize formatters
        formatters = {
            sqlfluff = {
                prepend_args = { '--dialect', 'sqlite' },
            },
            shfmt = {
                prepend_args = { '-i', '4' },
            },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function(_, opts)
        require('conform').setup(opts)
        vim.api.nvim_create_user_command('FormatDisable', function()
            vim.b.disable_autoformat = true
            vim.g.disable_autoformat = true
        end, {
            desc = 'Disable autoformat-on-save',
        })
        vim.api.nvim_create_user_command('FormatEnable', function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = 'Re-enable autoformat-on-save',
        })
    end,
}
