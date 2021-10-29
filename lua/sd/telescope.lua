require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
        --file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        --grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        --qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
}
