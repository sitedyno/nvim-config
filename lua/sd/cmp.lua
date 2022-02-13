vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local hascmp, cmp = pcall(require, 'cmp')

if not hascmp then
    print 'Failed to load cmp'
    return
end

local lspkind = require 'lspkind'

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
            -- vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
        -- { name = 'vsnip' },
        { name = 'luasnip' }, -- For luasnip users.
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        { name = 'path' },
        { name = 'zsh' },
    },
}

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    },
})

-- This is kinda ugly, but completion.autocomplete is not a simple boolean
-- With autocompletion & WSL2 :! will hang for 30+ seconds, instant on Linux ¯\_(ツ)_/¯
if vim.fn.has 'wsl' == 1 then
    cmp.setup.cmdline(':', {
        -- in cmdline Tab will invoke completion
        completion = { autocomplete = false },
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
else
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
end
