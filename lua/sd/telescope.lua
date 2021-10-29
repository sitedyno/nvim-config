require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
    },
    extensions = {
        fzf = {},
    },
}
require('telescope').load_extension('fzf')
