local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'

local function on_attach(client, bufnr)
    require('sd.lsp.keys').setup(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
        vim.notify_once 'Formatting available'
    end
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

lsp_installer.setup {}

local servers = lsp_installer.get_installed_servers()
for _, server in pairs(servers) do
    local opts = {}

    -- vim.notify seems to work here when print doesn't
    -- vim.notify(vim.inspect(server.name))

    if server.name == 'sumneko_lua' then
        opts = require('lua-dev').setup()
    end
    if server.name == 'diagnosticls' then
        -- Example of appending to default cmd for debugging
        -- local dlscfg = require('lspconfig.server_configurations.diagnosticls').default_config
        -- table.insert(dlscfg.cmd, '--log-level')
        -- table.insert(dlscfg.cmd, '4')
        -- vim.notify(vim.inspect(dlscfg.cmd))
        local filetypes = require 'sd.lsp.dls-filetypes'
        opts.filetypes = vim.tbl_keys(filetypes)
        opts.init_options = {
            filetypes = filetypes,
            linters = require 'sd.lsp.dls-linters',
        }
    end

    opts.capabilities = capabilities
    opts.on_attach = on_attach

    -- disable a server gracefully
    -- if server.name == 'phpactor' then
    --     opts.filetypes = { 'foo' }
    -- end

    lspconfig[server.name].setup(opts)
end
