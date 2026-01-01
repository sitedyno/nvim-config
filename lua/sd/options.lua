-- filetype detection
vim.cmd [[filetype plugin indent on]]

-- tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- mouse
vim.opt.mouse = 'n'

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

-- signcolumns
vim.opt.signcolumn = 'yes:2'
vim.g.committia_open_only_vim_starting = 0

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd [[
    augroup numberdisable
        autocmd!
        autocmd FileType help,lspinfo,man set nonumber
        autocmd FileType help,lspinfo,man set norelativenumber
        autocmd FileType help,lspinfo,man set signcolumn=no
    augroup END
]]

-- cursor line
vim.opt.cursorline = true

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'nosplit'

-- scroll
vim.opt.scrolloff = 8

-- close windows with 'q'
vim.cmd [[ autocmd FileType help,qf,lspinfo,git,checkhealth nnoremap <buffer><silent> q :close<cr>]]

-- easier window navigation
vim.cmd [[
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
]]

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.lsp.set_log_level 'debug'
if vim.fn.has 'nvim-0.5.1' == 1 then
    require('vim.lsp.log').set_format_func(vim.inspect)
end

-- CursorHold shorter updatetime
vim.opt.updatetime = 2000

-- Diagnostics
vim.diagnostic.config {
    jump = {
        float = {
            border = 'rounded',
            source = true,
        },
    },
    underline = false,
}
