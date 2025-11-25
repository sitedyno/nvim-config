local function on_attach(client, bufnr)
    require('sd.lsp.on_attach').on_attach(client, bufnr)
end

local capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)
require('mason-lspconfig').setup_handlers {
    -- disable a server by commenting out the setup call
    function(server_name)
        vim.lsp.config[server_name] = {
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,
    ['cssls'] = function()
        vim.lsp.config('cssls', {
            capabilities = capabilities,
            on_attach = on_attach,
            init_options = { provideFormatter = false },
        })
    end,
    ['phpactor'] = function()
        vim.lsp.config('phpactor', {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {
                'php',
                'php.html',
            },
            init_options = {
                ['language_server_phpstan.enabled'] = false,
                ['language_server_psalm.enabled'] = false,
                ['completion_worse.snippets'] = true,
                -- ['logging.enabled'] = true,
                -- ['logging.level'] = 'debug',
                -- ['logging.path'] = 'phpactor.log',
            },
            get_language_id = function(_, filetype)
                if filetype == 'php.html' then
                    return 'php'
                else
                    return filetype
                end
            end,
        })
    end,
    ['lua_ls'] = function()
        local settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace',
                },
                diagnostics = {
                    disable = { 'missing-fields', 'missing-parameter' },
                },
                format = {
                    enable = false,
                },
                telemetry = {
                    enable = false,
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        '${3rd}/luv/library',
                        '${3rd}/busted/library',
                    },
                },
            },
        }
        require('neodev').setup {
            capabilities = capabilities,
            on_attach = on_attach,
            override = function(root_dir, library)
                -- this is likely hit & miss but meh
                local nvim_proj = string.find(root_dir, 'nvim')
                if nvim_proj then
                    library.enabled = true
                    library.plugins = true
                end
            end,
            pathStrict = true,
        }
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = settings,
        })
    end,
    ['ts_ls'] = function()
        vim.lsp.config('ts_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
            -- Mason seems to be lieing about format.enable
            -- init_options = { ['javascript.format.enable'] = false },
        })
    end,
}
