local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require 'nvim-lsp-installer'
local lspconfig = require 'lspconfig'

local function on_attach(client, bufnr)
    require('sd.lsp.keys').setup(client, bufnr)
    require('lsp_signature').on_attach {
        floating_window = false,
    }
    if client.supports_method 'textDocument/formatting' then
        vim.notify_once 'Formatting available'
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
