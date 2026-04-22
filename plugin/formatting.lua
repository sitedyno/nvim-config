vim.g.format_disabled = true
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.pack.add {
    {
        src = 'https://github.com/stevearc/conform.nvim',
        version = vim.version.range '9.*',
    },
}

require('conform').setup {
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
    formatters = {
        sqlfluff = {
            prepend_args = { '--dialect', 'sqlite' },
        },
        shfmt = {
            prepend_args = { '-i', '4' },
        },
    },
    -- log_level = vim.log.levels.DEBUG,
    format_on_save = function(bufnr)
        if vim.g.format_disabled or vim.b[bufnr].format_disabled then
            return
        end
        return { timeout_ms = 500, lsp_format = 'never' }
    end,
}

vim.api.nvim_create_user_command('DisableFormatting', function(args)
    if args.bang then
        local bufnr = vim.api.nvim_get_current_buf()
        vim.b[bufnr].format_disabled = true
    else
        vim.g.format_disabled = true
    end
end, {
    desc = 'Disable format on save',
    bang = true,
})

vim.api.nvim_create_user_command('EnableFormatting', function(args)
    if args.bang then
        local bufnr = vim.api.nvim_get_current_buf()
        vim.b[bufnr].format_disabled = false
    else
        vim.g.format_disabled = false
    end
end, {
    desc = 'Enable format on save',
    bang = true,
})

vim.api.nvim_create_user_command('ListFormatters', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local fmtrs = require('conform').list_formatters_to_run(bufnr)
    local msg = ''
    for i, fmtr in pairs(fmtrs) do
        msg = msg .. fmtr.name
        if #fmtrs < i then
            msg = msg .. ', '
        end
    end
    vim.print(msg)
end, {
    desc = 'List formatters for this buffer',
})

vim.keymap.set({ 'n', 'v' }, '<leader>ef', '<cmd>EnableFormatting<cr>', { desc = 'Enable Formatting' })
vim.keymap.set({ 'n', 'v' }, '<leader>df', '<cmd>DisableFormatting<cr>', { desc = 'Disable Formatting' })
vim.keymap.set({ 'n', 'v' }, '<leader>lf', '<cmd>ListFormatting<cr>', { desc = 'List Formatting' })
