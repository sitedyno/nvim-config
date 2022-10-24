local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

require('null-ls').setup {
    sources = {
        -- formatters
        require('null-ls').builtins.formatting.stylua,
        require('null-ls').builtins.formatting.phpcbf,
        -- diagnostics
        require('null-ls').builtins.diagnostics.phpcs,
        require('null-ls').builtins.diagnostics.psalm,
    },
    on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}
