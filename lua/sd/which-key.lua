local haswk, wk = pcall(require, 'which-key')

if not haswk then
    print 'Failed to load which-key'
    return
end

local meta = '<space>'
local leader = '<leader>'
local mappings = {
    { '<leader>b', '<cmd>Telescope builtin<cr>', desc = 'Builtins' },
    { '<leader>c', group = 'Commands, Phpactor' },
    { '<leader>cc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>ce', '<cmd>PhpactorClassExpand<cr>', desc = 'Expand Class' },
    { '<leader>ch', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader>cs', 'bi\\<cmd>PhpactorClassExpand<cr>', desc = 'Expand Class (docblock)' },
    { '<leader>f', '<cmd>TestFile<cr>', desc = 'Test File' },
    { '<leader>g', group = 'Git,Grep' },
    { '<leader>gc', '<cmd>tab Git commit --verbose<cr>', desc = 'Git commit' },
    { '<leader>gf', '<cmd>Telescope git_files<cr>', desc = 'Git Ls-files' },
    { '<leader>gg', '<cmd>Telescope grep_string<cr>', desc = 'Grep String' },
    { '<leader>gl', '<cmd>tab Git log<cr>', desc = 'Git log' },
    { '<leader>gp', group = 'Git Pull,Push' },
    { '<leader>gpl', '<cmd>Git pull<cr>', desc = 'Git pull' },
    { '<leader>gps', '<cmd>Git push<cr>', desc = 'Git push' },
    { '<leader>gr', '<cmd>tab Git restore --staged --patch<cr>', desc = 'Git restore' },
    { '<leader>gs', '<cmd>Telescope git_status<cr>', desc = 'Git Status' },
    { '<leader>l', group = 'Live Grep' },
    { '<leader>la', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep All' },
    { '<leader>ls', '<cmd>Telescope dir live_grep<cr>', desc = 'Live Grep Selected' },
    { '<leader>nc', '<cmd>Neogen class<cr>', desc = 'Document Class' },
    { '<leader>nf', '<cmd>Neogen func<cr>', desc = 'Document Func' },
    { '<leader>ng', '<cmd>Neogit<cr>', desc = 'Neogit' },
    { '<leader>nl', '<cmd>NeovimLogFiles<cr>', desc = 'Neovim Log Files' },
    { '<leader>np', '<cmd>Neogen type<cr>', desc = 'Document Property' },
    { '<leader>p', group = 'Projectionist' },
    { '<leader>pa', '<cmd>A<cr>', desc = 'Alternate File' },
    { '<leader>ps', '<cmd>AS<cr>', desc = 'Alternate Horizontal' },
    { '<leader>pt', '<cmd>AT<cr>', desc = 'Alternate Tab' },
    { '<leader>pv', '<cmd>AV<cr>', desc = 'Alternate Vertical' },
    { '<leader>so', '<cmd>Telescope oldfiles<cr>', desc = 'Search Old/recent files' },
    { '<leader>t', group = 'Telescope,Testing' },
    { '<leader>ta', '<cmd>TestSuite<cr>', desc = 'Run Test Suite All Output (stderr)' },
    { '<leader>te', '<cmd>Telescope symbols<cr>', desc = 'Symbols/Emoji' },
    { '<leader>tk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
    { '<leader>tl', '<cmd>TestLast<cr>', desc = 'Run Last Test' },
    { '<leader>tn', '<cmd>TestNearest<cr>', desc = 'Run Nearest Test' },
    { '<leader>tr', '<cmd>Telescope registers<cr>', desc = 'Registers' },
    { '<leader>ts', '<cmd>TestSuite 2>/dev/null<cr>', desc = 'Run Test Suite' },
    { '<leader>tv', '<cmd>TestVisit<cr>', desc = 'Visit Last Run Test' },
    { '<leader>z', group = 'Zk' },
    {
        '<leader>zf',
        '<Cmd>ZkNotes { sort = { "modified" }, match = vim.fn.input("Search: ") }<CR>',
        desc = 'Search Notes',
    },
    { '<leader>zn', '<Cmd>ZkNew { title = vim.fn.input("Title: ") }<CR>', desc = 'New Note' },
    { '<leader>zo', '<Cmd>ZkNotes { sort = { "modified" } }<CR>', desc = 'List Notes' },
    { '<leader>zt', '<Cmd>ZkTags<CR>', desc = 'Tags' },
    { '<space>b', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<space>f', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<space>n', '<cmd>bnext<cr>', desc = 'Next Buffer' },
    { '<space>p', '<cmd>bprev<cr>', desc = 'Previous Buffer' },
    { '<space>y', '<cmd>Telescope yadm_files<cr>', desc = 'Open Dotfiles' },
}

wk.add(mappings)

local vopts = { mode = 'v' }
local vmappings = {
    { '<leader>zf', ":'<,'>ZkMatch<CR>", desc = 'Search Notes', mode = 'v' },
    { 'ih', desc = 'Select Hunk', mode = 'v' },
}

wk.add(vmappings, vopts)
