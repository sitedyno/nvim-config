local hasgs, gsigns = pcall(require, 'gitsigns')

if not hasgs then
    print 'Failed to load gitsigns'
    return
end

gsigns.setup {
    word_diff = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                return ']c'
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return '<Ignore>'
        end, {
            desc = 'Next Hunk',
            expr = true,
        })

        map('n', '[c', function()
            if vim.wo.diff then
                return '[c'
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return '<Ignore>'
        end, {
            desc = 'Previous Hunk',
            expr = true,
        })

        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage Hunk' })
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset Hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Staged Hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
        map('n', '<leader>hb', function()
            gs.blame_line { full = true }
        end, { desc = 'Hover Blame' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle Blame' })
        map('n', '<leader>tw', gs.toggle_word_diff, { desc = 'Toggle Word Diff' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Diff View' }) -- maybe use sindrets/diffview.nvim for these?
        map('n', '<leader>hD', function()
            gs.diffthis '~'
        end, { desc = 'Diff View HEAD~' }) -- maybe use sindrets/diffview.nvim for these?
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle Deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Hunk' })
    end,
}
