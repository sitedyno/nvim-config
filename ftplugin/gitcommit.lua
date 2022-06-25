local cmp = require 'cmp'
cmp.setup.buffer {
    sources = cmp.config.sources({
        { name = 'conventionalcommits' },
        { name = 'git' },
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
print 'hello'
