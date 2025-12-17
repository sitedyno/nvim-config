local installed_servers = require('mason-lspconfig').get_installed_servers()

local function on_attach(client, bufnr)
    require('sd.lsp.on_attach').on_attach(client, bufnr)
end

local capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)

-- set defaults for all clients
vim.lsp.config('*', {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- tweak configs if needed/wanted
vim.lsp.config.cssls = {
    init_options = { provideFormatter = false },
}
vim.lsp.config.lua_ls = {
    settings = {
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
            },
        },
    },
}
vim.lsp.config.phpactor = {
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

-- mass enable all servers vim.lsp.enable('*')
-- actually mason-lspconfig will automatically enable servers
-- it also has a way to disable autoenable in its setup
vim.lsp.enable(installed_servers)
-- manually disable a server
-- vim.lsp.enable('some_server', false)

-- this is not where you call vim.lsp.config
-- this seems to be an option instead of on_attach, or maybe for other stuff as well?
-- maybe this is a proper place to disable lsp formatting if desired
-- https://neovim.io/doc/user/lsp.html#lsp-attach
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('sd.lsp', {}),
--     callback = function (args)
--         local client = assert(vim.lsp.get_client_by_id(args.data.client_id, 'LSP client not found'))
--         if client:supports_method('textDocument/implementation') then
--             -- create a keymap for vim.lsp.buf.implementation
--         end
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--         end
--     end
-- })
