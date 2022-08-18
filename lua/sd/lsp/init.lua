local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'

local function on_attach(client, bufnr)
    require('sd.lsp.keys').setup(client, bufnr)

    -- thanks TJ https://github.com/tjdevries/config_manager/blob/5c203cee84071e5456dfe755e8f69cfc58dac7cf/xdg_config/nvim/lua/tj/lsp/init.lua#L136
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
    end
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
    if config.on_attach then
        config.on_attach = util.add_hook_after(config.on_attach, on_attach)
    else
        config.on_attach = on_attach
    end
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    config.capabilities = capabilities
end)

require('mason-lspconfig').setup_handlers {
    -- disable a server by commenting out the setup call
    function(server_name)
        lspconfig[server_name].setup {}
    end,
    ['diagnosticls'] = function()
        local filetypes = require 'sd.lsp.dls-filetypes'
        lspconfig.diagnosticls.setup {
            filetypes = vim.tbl_keys(filetypes),
            init_options = {
                filetypes = filetypes,
                linters = require 'sd.lsp.dls-linters',
            },
        }
    end,
    ['phpactor'] = function()
        lspconfig.phpactor.setup {
            init_options = {
                ['language_server_phpstan.enabled'] = false,
                ['language_server_psalm.enabled'] = false,
                ['completion_worse.snippets'] = true,
            },
        }
    end,
    ['sumneko_lua'] = function()
        local settings = {
            Lua = {
                telemetry = {
                    enable = false,
                },
            },
        }
        -- this is likely hit & miss but meh
        local nvim_proj = string.find(vim.fn.getcwd(), 'nvim$')
        if nvim_proj then
            lspconfig.sumneko_lua.setup(require('lua-dev').setup {
                settings = settings,
            })
        else
            lspconfig.sumneko_lua.setup {
                settings = settings,
            }
        end
    end,
}
