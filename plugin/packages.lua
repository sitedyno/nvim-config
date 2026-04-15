local group = vim.api.nvim_create_augroup('sd.packages', { clear = true})

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

vim.api.nvim_create_user_command('UpdatePackages', function()
    vim.pack.update()
end, {})

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
vim.keymap.set({ 'n' }, '<leader>cp', clean_packages, { desc = 'Clean Packages' })
vim.keymap.set({ 'n' }, '<leader>up', '<cmd>UpdatePackages<cr>', { desc = 'Update Packages' })

