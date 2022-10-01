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
            l = { '<cmd>Git log<cr>', 'Git log' },
            p = {
                name = 'Git Pull,Push',
                l = { '<cmd>Git pull<cr>', 'Git pull' },
                s = { '<cmd>Git push<cr>', 'Git push' },
            },
            r = { '<cmd>Git restore --staged --patch<cr>', 'Git restore' },
            s = { '<cmd>Telescope git_status<cr>', 'Git Status' },
        },
        l = { '<cmd>Telescope live_grep<cr>', 'Live Grep' },
        n = {
            c = { '<cmd>Neogen class<cr>', 'Document Class' },
            f = { '<cmd>Neogen func<cr>', 'Document Func' },
            g = { '<cmd>Neogit kind=vsplit<cr>', 'Neogit' },
            p = { '<cmd>Neogen type<cr>', 'Document Property' },
        },
        o = { '<cmd>Telescope oldfiles<cr>', 'Old (Recent) Files' },
        p = {
            name = 'Projectionist',
            a = { '<cmd>A<cr>', 'Alternate File' },
            s = { '<cmd>AS<cr>', 'Alternate Horizontal' },
            t = { '<cmd>AT<cr>', 'Alternate Tab' },
            v = { '<cmd>AV<cr>', 'Alternate Vertical' },
        },
        t = {
            name = 'Telescope,Testing',
            k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
            l = { '<cmd>TestLast<cr>', 'Run Last Test' },
            n = { '<cmd>TestNearest<cr>', 'Run Nearest Test' },
            r = { '<cmd>Telescope registers<cr>', 'Registers' },
            s = { '<cmd>TestSuite<cr>', 'Run Test Suite' },
            v = { '<cmd>TestVisit<cr>', 'Visit Last Run Test' },
        },
        z = {
            name = 'Zk',
            n = { '<Cmd>ZkNew { title = vim.fn.input("Title: ") }<CR>', 'New Note' },
            o = { '<Cmd>ZkNotes { sort = { "modified" } }<CR>', 'List Notes' },
            t = { '<Cmd>ZkTags<CR>', 'Tags' },
            f = { '<Cmd>ZkNotes { sort = { "modified" }, match = vim.fn.input("Search: ") }<CR>', 'Search Notes' },
        },
    },
}

wk.register(mappings)

local vopts = { mode = 'v' }
local vmappings = {
    [leader] = {
        z = {
            f = { ":'<,'>ZkMatch<CR>", 'Search Notes' },
        },
    },
}

wk.register(vmappings, vopts)
