local haswk, wk = pcall(require, 'which-key')

if not haswk then
    print 'Failed to load which-key'
    return
end

local mappings = {
    ['<leader>b'] = {
        name = 'Buffers,Telescope',
        b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
        t = { '<cmd>Telescope builtin<cr>', 'Telescope Builtins' },
    },
    ['<leader>c'] = {
        name = 'Commands',
        c = { '<cmd>Telescope commands<cr>', 'Commands' },
        f = { '<cmd>Telescope command_history<cr>', 'Command History' },
    },
    ['<leader>f'] = {
        name = 'Files',
        b = { '<cmd>Telescope file_browser<cr>', 'File Browser' },
        f = { '<cmd>Telescope find_files<cr>', 'Find files' },
        r = { '<cmd>Telescope oldfiles<cr>', 'Find Recent Files' },
    },
    ['<leader>g'] = {
        name = 'Git,Grep',
        f = { '<cmd>Telescope git_files<cr>', 'git ls-files' },
        s = { '<cmd>Telescope grep_string<cr>', 'Grep String' },
    },
    ['<leader>l'] = {
        name = 'Grep',
        g = { '<cmd>Telescope live_grep<cr>', 'Live Grep' },
    },
    ['<leader>t'] = {
        name = 'Telescope',
        b = { '<cmd>Telescope builtin<cr>', 'Builtins' },
        g = { '<cmd>Telescope git_status<cr>', 'Git Status' },
        k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
        n = { '<cmd>TestNearest<cr>', 'Test Nearest' },
        f = { '<cmd>TestFile<cr>', 'Test File' },
        r = { '<cmd>Telescope registers<cr>', 'Registers' },
        s = { '<cmd>TestSuite<cr>', 'Test Suite' },
        l = { '<cmd>TestLast<cr>', 'Test Last' },
        v = { '<cmd>TestVisit<cr>', 'Test Visit' },
    },
    ['<leader><space>'] = { '<cmd>nohl<cr>', 'No Highlight' },
}

wk.register(mappings)
