local haswk, wk = pcall(require, 'which-key')

if not haswk then
    print 'Failed to load which-key'
    return
end

local meta = '<space>'
local leader = '<leader>'
local mappings = {
    [meta] = {
        f = { '<cmd>Telescope find_files<cr>', 'Find files' },
        b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
    },
    [leader] = {
        b = { '<cmd>Telescope builtin<cr>', 'Builtins' },
        c = {
            name = 'Commands',
            c = { '<cmd>Telescope commands<cr>', 'Commands' },
            h = { '<cmd>Telescope command_history<cr>', 'Command History' },
        },
        f = { '<cmd>TestFile<cr>', 'Test File' },
        g = {
            name = 'Git,Grep',
            c = { '<cmd>Git commit --verbose<cr>', 'Git commit' },
            f = { '<cmd>Telescope git_files<cr>', 'Git Ls-files' },
            g = { '<cmd>Telescope grep_string<cr>', 'Grep String' },
            p = {
                name = 'Git Pull,Push',
                l = { '<cmd>Git pull<cr>', 'Git pull' },
                s = { '<cmd>Git push<cr>', 'Git push' },
            },
            s = { '<cmd>Telescope git_status<cr>', 'Git Status' },
        },
        l = { '<cmd>Telescope live_grep<cr>', 'Live Grep' },
        n = { '<cmd>Neogit kind=vsplit<cr>', 'Neogit' },
        o = { '<cmd>Telescope oldfiles<cr>', 'Old (Recent) Files' },
        t = {
            name = 'Telescope,Testing',
            k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
            l = { '<cmd>TestLast<cr>', 'Test Last' },
            n = { '<cmd>TestNearest<cr>', 'Test Nearest' },
            r = { '<cmd>Telescope registers<cr>', 'Registers' },
            s = { '<cmd>TestSuite<cr>', 'Test Suite' },
            v = { '<cmd>TestVisit<cr>', 'Test Visit' },
        },
    },
}

wk.register(mappings)
