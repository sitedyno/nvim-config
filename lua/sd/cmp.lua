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
            dup = 0,
            menu = {
                phpactor = '[phpactor]',
                buffer = '[Buf]',
                nvim_lsp = '[LSP]',
                path = '[Path]',
                luasnip = '[Snip]',
                zsh = '[Zsh]',
                ['vim-dadbod-completion'] = '[DB]',
                git = '[Git]',
            },
            with_text = true,
        },
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
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
    sources = cmp.config.sources({
        -- { name = 'phpactor' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        -- { name = 'nvim_lsp_signature_help' },
    }, {
        { name = 'path' },
        { name = 'vim-dadbod-completion' },
        { name = 'zsh' },
    }, {
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
    }),
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline {},
    sources = cmp.config.sources {
        { name = 'buffer' },
    },
})

-- This is kinda ugly, but completion.autocomplete is not a simple boolean
-- With autocompletion & WSL2 :! will hang for 30+ seconds, instant on Linux ¯\_(ツ)_/¯
if vim.fn.has 'wsl' == 1 then
    cmp.setup.cmdline(':', {
        -- in cmdline Tab will invoke completion
        completion = { autocomplete = false },
        mapping = cmp.mapping.preset.cmdline {},
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
else
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline {},
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
end

require('cmp_zsh').setup {
    -- zshrc = true,
    filetypes = { 'zsh' },
}

require('cmp_git').setup {
    filetypes = { 'gitcommit', 'octo' },
}
