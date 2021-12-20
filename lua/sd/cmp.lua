vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local hascmp, cmp = pcall(require, 'cmp')

if not hascmp then
    print 'Failed to load cmp'
    return
end

local lspkind = require 'lspkind'
local cmp_buffer = require 'cmp_buffer'

cmp.setup {
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = '[Buf]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[API]',
                path = '[Path]',
                vsnip = '[Snip]',
            },
        },
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<C-q>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        -- Invokes completion, could be called open...
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
        end,
    },
    sorting = {
        comparators = {
            cmp.config.compare.length,
            cmp.config.compare.kind,
        },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        { name = 'path' },
    },
}

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    -- in cmdline Tab will invoke completion
    completion = { autocomplete = false },
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
