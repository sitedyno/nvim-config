local null_ls = require 'null-ls'

local function filetype_ignored(ignored_filetypes)
    local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype')
    vim.pretty_print(filetype)
    if ignored_filetypes[filetype] then
        return false
    end
    return true
end

null_ls.setup {
    -- debug = true,
    should_attach = function(bufnr)
        local ignored_filetypes = {
            packer = true,
        }
        local ignored_names = {
            __committia_status__ = true,
            __committia_diff__ = true,
        }

        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if ignored_names[vim.fs.basename(bufname)] then
            return false
        end

        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        if ignored_filetypes[filetype] then
            return false
        end

        return true
    end,
    sources = {
        -- see also lua/sd/lsp/mason-null-ls.lua
        -- code actions
        null_ls.builtins.code_actions.shellcheck,

        -- diagnostics
        -- ansblels uses ansible-lint
        -- null_ls.builtins.diagnostics.ansiblelint,
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
            condition = function(_)
                return filetype_ignored {
                    ['php.html'] = true,
                }
            end,
            filetypes = { 'jinja.html', 'html', 'htmldjango', 'twig' },
        },
        null_ls.builtins.diagnostics.djlint.with {
            filetypes = { 'django', 'html', 'jinja.html', 'htmldjango' },
        },
        null_ls.builtins.diagnostics.editorconfig_checker.with {
            condition = function(utils)
                return utils.root_has_file { '.editorconfig' }
                    and filetype_ignored {
                        ['gitcommit'] = true,
                    }
            end,
        },
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.phpcs.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/phpcs' }
            end,
        },
        null_ls.builtins.diagnostics.psalm.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/psalm' }
            end,
            diagnostics_format = '[#{c}] #{m}',
            -- format = 'json',
            -- from_stderr = false,
            ignore_stderr = true,
        },
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.sqlfluff.with {
            extra_args = { '--dialect', 'sqlite' }, -- change to your dialect
        },
        null_ls.builtins.diagnostics.twigcs,
        null_ls.builtins.diagnostics.zsh,

        -- formatters
        null_ls.builtins.formatting.phpcbf.with {
            condition = function(utils)
                return utils.root_has_file { 'vendor/bin/phpcbf' }
            end,
        },
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.sqlfluff.with {
            extra_args = { '--dialect', 'sqlite' }, -- change to your dialect
        },
        null_ls.builtins.formatting.stylua,
    },
    on_attach = function(client, bufnr)
        require('sd.lsp.on_attach').on_attach(client, bufnr)
    end,
}
