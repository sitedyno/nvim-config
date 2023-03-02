local null_ls = require 'null-ls'

local function filetype_ignored(ignored_filetypes)
    local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype')
    if ignored_filetypes[filetype] then
        return false
    end
    return true
end

local phpcs_code_action = {
    async = true,
    name = 'phpcs_code_action',
    method = null_ls.methods.CODE_ACTION,
    filetypes = { 'php' },
    generator = {
        fn = function(_)
            return {
                {
                    title = 'Check coding standards for this project',
                    action = function()
                        local command = 'vendor/bin/phpcs'
                        local args = {
                            -- json returns all files even if they do not have an error...
                            '--report=emacs',
                            -- silence status messages during processing
                            '-q',
                            -- always report codes
                            '-s',
                            -- phpcs exits with a non-0 exit code when messages are reported but we only want to know if the command fails
                            '--runtime-set',
                            'ignore_warnings_on_exit',
                            '1',
                            '--runtime-set',
                            'ignore_errors_on_exit',
                            '1',
                            -- get absolute paths under params.output.files
                            '--basepath=',
                            -- hard coded for now, make it flexible later
                            'src',
                            'tests',
                        }
                        local job = require 'plenary.job'
                        local result = job:new({
                                command = command,
                                args = args,
                                cwd = vim.fn.getcwd(),
                            }):sync()
                        -- it seems lua pattern matching does not support modifiers to captures so something like (error)? will not work
                        -- lua pattern matching also does not have an `OR` operator so cannot do (warning|error)
                        local pattern = '([^:]+):(%d+):(%d+): ([warningeo]+) %- (.*)'
                        local qf = {}
                        for i, value in pairs(result) do
                            local matches = { value:match(pattern) }
                            local groups = { 'filename', 'lnum', 'col', 'type', 'text' }
                            local list = {}
                            for k, v in pairs(matches) do
                                if groups[k] == 'type' then
                                    if v == 'warning' then
                                        v = 'W'
                                    elseif v == 'error' then
                                        v = 'E'
                                    end
                                end
                                list[groups[k]] = v
                            end
                            qf[i] = list
                        end
                        vim.fn.setqflist(qf)
                        vim.api.nvim_command 'botright copen'
                    end,
                },
            }
        end,
    },
}

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
            runtime_condition = function(_)
                return filetype_ignored { ['php.html'] = true }
            end,
            filetypes = { 'jinja.html', 'html', 'htmldjango', 'twig' },
        },
        null_ls.builtins.diagnostics.djlint.with {
            filetypes = { 'django', 'html', 'jinja.html', 'htmldjango' },
        },
        null_ls.builtins.diagnostics.editorconfig_checker.with {
            condition = function(utils)
                return utils.root_has_file { '.editorconfig' }
            end,
            runtime_condition = function(_)
                return filetype_ignored { ['gitcommit'] = true }
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
            -- ignore_stderr = true,
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
        phpcs_code_action,
    },
    on_attach = function(client, bufnr)
        require('sd.lsp.on_attach').on_attach(client, bufnr)
    end,
}
