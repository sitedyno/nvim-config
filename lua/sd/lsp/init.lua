local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require 'nvim-lsp-installer'

local function on_attach(client, bufnr)
    require('sd.lsp.keys').setup(client, bufnr)
    require('lsp_signature').on_attach()
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == 'sumneko_lua' then
        opts = require('lua-dev').setup()
    end
    if server.name == 'diagnosticls' then
        local filetypes = require 'sd.lsp.dls-filetypes'
        opts.filetypes = vim.tbl_keys(filetypes)
        opts.init_options = {
            filetypes = filetypes,
            linters = require 'sd.lsp.dls-linters',
            -- couldn't get formatting to work :(
            -- formatters = require 'sd.lsp.dls-formatters',
            -- formatFiletypes = require 'sd.lsp.dls-format-filetypes',
        }
    end

    opts.capabilities = capabilities
    opts.on_attach = on_attach

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    server:setup(opts)
end)
