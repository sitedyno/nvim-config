vim.g.committia_open_only_vim_starting = 0

vim.pack.add {
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/rhysd/committia.vim',
    {
        src = 'https://github.com/dlyongemallo/diffview.nvim',
        version = vim.version.range '0.*',
    },
}

require('gitsigns').setup {
    on_attach = function(_)
        local gitsigns = require 'gitsigns'

        -- Navigation
        local function next_hunk()
            if vim.wo.diff then
                vim.cmd.normal { '<leader>nh', bang = true }
            else
                gitsigns.nav_hunk 'next'
            end
        end

        local function previous_hunk()
            if vim.wo.diff then
                vim.cmd.normal { '<leader>ph', bang = true }
            else
                gitsigns.nav_hunk 'prev'
            end
        end

        local function stage_hunk()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end

        local function reset_hunk()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end

        local function blame_line()
            gitsigns.blame_line { full = true }
        end

        local function diff_previous()
            gitsigns.diffthis '~'
        end

        local function send_to_qf()
            gitsigns.setqflist 'all'
        end

        vim.keymap.set('n', '<leader>nh', next_hunk, { desc = 'Next Hunk' })
        vim.keymap.set('n', '<leader>ph', previous_hunk, { desc = 'Previous Hunk' })

        -- Actions
        vim.keymap.set('n', '<leader>sh', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
        vim.keymap.set('n', '<leader>rh', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
        vim.keymap.set('v', '<leader>sh', stage_hunk, { desc = 'Stage Hunk' })
        vim.keymap.set('v', '<leader>rh', reset_hunk, { desc = 'Reset Hunk' })
        vim.keymap.set('n', '<leader>Sh', gitsigns.stage_buffer, { desc = 'Stage Hunks' })
        vim.keymap.set('n', '<leader>Rh', gitsigns.reset_buffer, { desc = 'Reset Hunks' })
        vim.keymap.set('n', '<leader>Ph', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
        vim.keymap.set('n', '<leader>ih', gitsigns.preview_hunk_inline, { desc = 'Inline Hunk preview' })
        vim.keymap.set('n', '<leader>bh', blame_line, { desc = 'Blame Hunk line' })
        vim.keymap.set('n', '<leader>dh', gitsigns.diffthis, { desc = 'Diffthis Hunk' })
        vim.keymap.set('n', '<leader>Dh', diff_previous, { desc = 'Diffthis ~ Hunk ' })
        vim.keymap.set('n', '<leader>Sq', send_to_qf, { desc = 'Send all hunks to Quickfix' })
        vim.keymap.set('n', '<leader>sq', gitsigns.setqflist, { desc = 'send Hunk to Quickfix list' })

        -- Toggles
        vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line Blame' })
        vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle Word diff' })

        -- Text object
        vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select Hunk' })
    end,
}

vim.keymap.set({ 'n' }, '<leader>gc', '<cmd>tab Git commit --verbose<cr>', { desc = 'Git Commit' })
vim.keymap.set({ 'n' }, '<localleader>D', '<cmd>DiffViewToggle<cr>', { desc = 'Open Diffview' })
