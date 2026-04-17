require('vim._core.ui2').enable {
    enable = true,
    msg = {
        targets = {
            [''] = 'msg',
            empty = 'cmd',
            bufwrite = 'msg',
            confirm = 'cmd',
            emsg = 'pager',
            echo = 'msg',
            echomsg = 'msg',
            echoerr = 'pager',
            completion = 'cmd',
            list_cmd = 'pager',
            lua_error = 'pager',
            lua_print = 'msg',
            progress = 'pager',
            rpc_error = 'pager',
            quickfix = 'msg',
            search_cmd = 'cmd',
            search_count = 'cmd',
            shell_cmd = 'pager',
            shell_err = 'pager',
            shell_out = 'pager',
            shell_ret = 'msg',
            undo = 'msg',
            verbose = 'pager',
            wildlist = 'cmd',
            wmsg = 'msg',
            typed_cmd = 'cmd',
        },
        cmd = {
            height = 0.5,
        },
        dialog = {
            height = 0.5,
        },
        msg = {
            height = 0.3,
            timeout = 5000,
        },
        pager = {
            height = 0.5,
        },
    },
}

vim.cmd.colorscheme 'lunaperche'

vim.g.mapleader = ','
vim.g.maplocalleader = ' '
vim.g.log_level = 2

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

vim.pack.add({'https://github.com/scottmckendry/cyberdream.nvim'})
require('cyberdream').setup({transparent = true})
vim.cmd.colorscheme('cyberdream')
