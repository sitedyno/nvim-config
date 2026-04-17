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
    keymap = {
        ['<C-space>'] = false,
        ['<Up>'] = false,
        ['<Down>'] = false,
        ['<Tab>'] = false,
        ['<S-Tab>'] = false,

        ['<C-e>'] = { 'hide', 'fallback' },
        ['<C-y>'] = { 'select_and_accept', 'fallback' },

        ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
        ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },

        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    sources = {
        default = {
            'lsp',
            'buffer',
            'snippets',
            'path',
        },
    },
    snippets = {
        preset = 'luasnip',
    },
}
