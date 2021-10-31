local pkg_path = vim.split(package.path, ';')
table.insert(pkg_path, 'lua/?.lua')
table.insert(pkg_path, 'lua/?/init.lua')

local sumneko_lua = {
    cmd = {
        '/usr/bin/lua-language-server',
    },
    settings = {
        Lua = {
            completion = {
                autoRequire = false,
                callSnippet = 'Replace',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            runtime = {
                version = 'LuaJIT',
                path = pkg_path,
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.expand '$HOME/.local/share/nvim/site/pack/packer/start'] = true,
                },
            },
        },
    },
}

return sumneko_lua
