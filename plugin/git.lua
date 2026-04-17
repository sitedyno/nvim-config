vim.g.committia_open_only_vim_starting = 0

vim.pack.add {
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/rhysd/committia.vim',
    -- 'https://github.com/asana17/commit-buf.nvim',
}

-- vim.api.nvim_create_autocmd('VimEnter', {
-- 	group = group,
-- 	callback = function(_)
-- 		require('commit-buf').setup({
-- 			window = {
-- 				columns = {
-- 					[1] = { 'commit_buf', },
-- 					[2] = { 'git_diff_staged', },
-- 				},
-- 			},
-- 			verbose = true,
-- 		})
-- 	end
-- })

require('gitsigns').setup {
    on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<leader>nh', function()
            if vim.wo.diff then
                vim.cmd.normal { '<leader>nh', bang = true }
            else
                gitsigns.nav_hunk 'next'
            end
        end, { desc = 'Next Hunk' })

        map('n', '<leader>ph', function()
            if vim.wo.diff then
                vim.cmd.normal { '<leader>ph', bang = true }
            else
                gitsigns.nav_hunk 'prev'
            end
        end, { desc = 'Previous Hunk' })

        -- Actions
        map('n', '<leader>sh', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
        map('n', '<leader>rh', gitsigns.reset_hunk, { desc = 'Reset Hunk' })

        map('v', '<leader>sh', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Stage Hunk' })

        map('v', '<leader>rh', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Reset Hunk' })

        map('n', '<leader>Sh', gitsigns.stage_buffer, { desc = 'Stage Hunks' })
        map('n', '<leader>Rh', gitsigns.reset_buffer, { desc = 'Reset Hunks' })
        map('n', '<leader>Ph', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
        map('n', '<leader>ih', gitsigns.preview_hunk_inline, { desc = 'Inline Hunk preview' })

        map('n', '<leader>bh', function()
            gitsigns.blame_line { full = true }
        end, { desc = 'Blame Hunk line' })

        map('n', '<leader>dh', gitsigns.diffthis, { desc = 'Diffthis Hunk' })

        map('n', '<leader>Dh', function()
            gitsigns.diffthis '~'
        end, { desc = 'Diffthis ~ Hunk ' })

        map('n', '<leader>Sq', function()
            gitsigns.setqflist 'all'
        end, { desc = 'Send all hunks to Quickfix' })
        map('n', '<leader>sq', gitsigns.setqflist, { desc = 'send Hunk to Quickfix list' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line Blame' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle Word diff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select Hunk' })
    end,
}

vim.keymap.set({ 'n' }, '<leader>gc', '<cmd>tab Git commit --verbose<cr>', { desc = 'Git Commit' })
