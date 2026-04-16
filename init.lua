-- require('vim._core.ui2').enable {}

vim.cmd.colorscheme 'lunaperche'

vim.g.mapleader = ','
vim.g.maplocalleader = ' '

local undodir = vim.fn.stdpath 'state' .. '/undo'
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, 'p')
end

-- native vim style options
vim.o.undofile = true
vim.o.undodir = undodir
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.list = true
vim.o.signcolumn = 'yes:2'
vim.o.winborder = 'rounded'
vim.o.autoread = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500

-- "new" neovim style options
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.opt.termguicolors = true

vim.diagnostic.config {
    jump = {
        float = {
            source = true,
        },
    },
    underline = false,
}

local group = vim.api.nvim_create_augroup('sd', {})

vim.keymap.set({ 'n' }, '<localleader>R', '<cmd>restart<cr>', { desc = 'Restart neovim' })

local dlog = require('sd.dlog')
local testlogger = dlog.logger('testlogger')
testlogger('test %s', 'meh')
