vim.pack.add({'https://github.com/smartpde/debuglog'})

require('debuglog').setup({
    log_to_console = true,
    log_to_file = true,
    time_hl_group = "Comment",
})

vim.keymap.set({'n','v'}, '<leader>el', function ()
    require('debuglog').enable('*')
    vim.notify('Logging Enabled', vim.log.levels.INFO)
end, { desc = 'Enable Logging'})
vim.keymap.set({'n','v'}, '<leader>dl', '<cmd>DebugLogDisable<cr>', { desc = 'Enable Logging'})
