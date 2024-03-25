local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'

local function on_attach(client, bufnr)
    require('sd.lsp.on_attach').on_attach(client, bufnr)
end

-- This avoids having to do:
-- on_attach = on_attach
-- capabilities = capabilities
-- in each of the setup_handlers below
util.on_setup = util.add_hook_after(util.on_setup, function(config)
    if config.on_attach then
        config.on_attach = util.add_hook_after(config.on_attach, on_attach)
    else
        config.on_attach = on_attach
    end
    config.capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
    )
end)

require('mason-lspconfig').setup_handlers {
    -- disable a server by commenting out the setup call
    function(server_name)
        lspconfig[server_name].setup {}
    end,
    ['phpactor'] = function()
        lspconfig.phpactor.setup {
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
        }
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
        lspconfig.lua_ls.setup {
            settings = settings,
        }
    end,
}
