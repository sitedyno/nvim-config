require('vim._core.ui2').enable {}

vim.cmd.colorscheme 'lunaperche'

vim.g.mapleader = ','
vim.g.maplocalleader = ' '

-- native vim style options
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

vim.api.nvim_create_autocmd('PackChanged', {
    group = group,
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then
                vim.cmd.packadd 'nvim-treesitter'
            end
            vim.cmd 'TSUpdate'
        end
    end,
})

-- https://github.com/artorias305/nvim/blob/14fe8f869393a957718d46b4a62169df8e4e307f/init.lua#L63
local function clean_packages()
    local active_plugins = {}
    local unused_plugins = {}

    for _, plugin in ipairs(vim.pack.get()) do
        active_plugins[plugin.spec.name] = plugin.active
    end

    for _, plugin in ipairs(vim.pack.get()) do
        if not active_plugins[plugin.spec.name] then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        print 'No unused plugins.'
        return
    end

    local choice = vim.fn.confirm('Remove unused plugins?', '&Yes\n&No', 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end
vim.keymap.set('n', '<leader>cp', clean_packages, { desc = 'Clean Packages' })
