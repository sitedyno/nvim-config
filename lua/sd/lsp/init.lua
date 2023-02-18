local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'

local function on_attach(client, bufnr)
    require('sd.lsp.on_attach').on_attach(client, bufnr)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
    if config.on_attach then
        config.on_attach = util.add_hook_after(config.on_attach, on_attach)
    else
        config.on_attach = on_attach
    end
    local cnl = require 'cmp_nvim_lsp'
    config.capabilities = cnl.default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
            },
        }
    end,
    ['lua_ls'] = function()
        local settings = {
            Lua = {
                telemetry = {
                    enable = false,
                },
            },
        }
        require('neodev').setup {
            override = function(root_dir, library)
                -- this is likely hit & miss but meh
                local nvim_proj = string.find(root_dir, 'nvim$')
                if nvim_proj then
                    library.enabled = true
                    library.plugins = true
                end
            end,
        }
        lspconfig.lua_ls.setup {
            settings = settings,
        }
    end,
}
