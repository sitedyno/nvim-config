local null_ls = require 'null-ls'

null_ls.setup {
    -- debug = true,
    should_attach = function(bufnr)
        local ignored_filetypes = {
            packer = true,
        }
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        if ignored_filetypes[filetype] then
            return false
        end
        return true
    end,
    sources = {
        -- see also lua/sd/lsp/mason-null-ls.lua
        -- null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.curlylint.with {
            args = {
                '--rule',
                'aria_role: true',
                -- '--rule',
                -- 'django_forms_rendering: true',
                '--rule',
                'html_has_lang: true',
                '--rule',
                'image_alt: true',
                -- '--rule',
                -- 'indent: "tab"',
                '--rule',
                'meta_viewport: true',
                '--rule',
                'no_autofocus: true',
                '--rule',
                'tabindex_no_positive: true',
                '--quiet',
                '-',
                '--format',
                'json',
                '--stdin-filepath',
                '$FILENAME',
            },
            filetypes = { 'jinja.html', 'html', 'htmldjango', 'twig' },
        },
        null_ls.builtins.diagnostics.djlint.with {
            filetypes = { 'django', 'html', 'jinja.html', 'htmldjango' },
        },
        -- I think the LSP handles this better
        -- null_ls.builtins.diagnostics.php,
        null_ls.builtins.formatting.phpcbf.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/phpcbf' }
            end,
        },
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
        null_ls.builtins.diagnostics.sqlfluff.with {
            extra_args = { '--dialect', 'sqlite' }, -- change to your dialect
        },
        null_ls.builtins.diagnostics.twigcs,
    },
    on_attach = function(client, bufnr)
        require('sd.lsp.on_attach').on_attach(client, bufnr)
    end,
}
