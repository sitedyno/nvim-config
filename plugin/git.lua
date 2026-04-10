local group = vim.api.nvim_create_augroup('sd.git', {})

vim.g.committia_open_only_vim_starting = 0

vim.pack.add({
	'https://github.com/tpope/vim-fugitive',
	'https://github.com/lewis6991/gitsigns.nvim',
	'https://github.com/rhysd/committia.vim',
	-- 'https://github.com/asana17/commit-buf.nvim',
})

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

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = 'Next Hunk' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = 'Next Hunk' })

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Stage Hunk' })

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Reset Hunk' })

    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Hunks' })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Hunks Reset' })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'preview Hunk Inline' })

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end, { desc = 'Hunk Blame line' })

    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Hunk Diffthis' })

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end, { desc = 'Hunk Diffthis ~' })

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'send all Hunks to Quickfix' })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = 'send Hunk to Quickfix list' })

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line Blame' })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Toggle Word diff' })

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'Select Hunk' })
  end
}

vim.keymap.set({'n'}, '<leader>gc', '<cmd>Git commit --verbose<cr>', { desc = 'Git Commit' })
