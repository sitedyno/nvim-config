require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    extensions = {
        fzf = {},
        fzf_writer = {},
    },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('fzf_writer')
