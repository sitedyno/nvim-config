vim.pack.add {
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range 'v1.*',
    },
    {
        src = 'https://github.com/L3MON4D3/LuaSnip',
        version = vim.version.range 'v2.*',
    },
}

require('blink.cmp').setup {
    completion = {
        documentation = {
            auto_show = true,
        },
    },
    sources = {
        default = {
            'lsp',
            'path',
            'buffer',
            'snippets',
        },
    },
    snippets = {
        expand = function(snippet)
            require('luasnip').lsp_expand(snippet)
        end,
    },
}
