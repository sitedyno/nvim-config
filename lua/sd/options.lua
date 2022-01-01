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

-- theme
vim.opt.termguicolors = true
local skpath = vim.fn.stdpath 'data' .. '/site/pack/packer/start/sonokai'
if vim.fn.empty(vim.fn.glob(skpath)) == 0 then
    vim.cmd [[colorscheme sonokai]]
end

-- mouse
vim.opt.mouse = 'n'

-- folding
-- vim.cmd [[
--     set foldmethod=expr
--     set foldexpr=nvim_treesitter#foldexpr()
-- ]]
-- vim.cmd [[ autocmd BufEnter * execute 'normal zn' ]]

-- signcolumns
vim.opt.signcolumn = 'yes:2'

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

-- format on write
vim.cmd [[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.lua,*.php FormatWrite
    augroup END
]]

-- close windows with 'q'
vim.cmd [[ autocmd FileType help,qf,lspinfo nnoremap <buffer><silent> q :close<cr>]]

-- easier window navigation
vim.cmd [[
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
]]

-- vim.lsp.set_log_level 'debug'
if vim.fn.has 'nvim-0.5.1' == 1 then
    require('vim.lsp.log').set_format_func(vim.inspect)
end
