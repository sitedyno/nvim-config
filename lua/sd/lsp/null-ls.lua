local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

null_ls.setup {
    sources = {
        -- code actions
        null_ls.builtins.code_actions.shellcheck,
        -- diagnostics
        null_ls.builtins.diagnostics.ansiblelint,
        -- null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.hadolint,
        -- I think the LSP handles this better
        -- null_ls.builtins.diagnostics.php,
        null_ls.builtins.diagnostics.phpcs.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/phpcs' }
            end,
        },
        null_ls.builtins.diagnostics.psalm.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/psalm' }
            end,
        },
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.sqlfluff.with {
            extra_args = { '--dialect', 'sqlite' }, -- change to your dialect
        },
        null_ls.builtins.diagnostics.twigcs,
        null_ls.builtins.diagnostics.zsh,
        -- formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.phpcbf.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/phpcbf' }
            end,
        },
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