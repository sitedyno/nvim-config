local function on_attach(client, bufnr)
    require('sd.lsp.keys').setup(client, bufnr)
    require "lsp_signature".on_attach()
end

local servers = {
    -- intelephense = require('sd.lsp.intelephense'),
    phpactor = {},
    sumneko_lua = require('sd.lsp.sumneko_lua'),
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspc = require('lspconfig')

for index, server in pairs(servers) do

    server.on_attach = on_attach
    server.capabilities = capabilities
    server.flags = { debounce_text_changes = 150 }

    lspc[index].setup(server)
end
