vim.pack.add({'https://github.com/XXiaoA/atone.nvim'})

local group = vim.api.nvim_create_augroup('sd.undo', { clear = true })

vim.api.nvim_create_autocmd('UIEnter', {
    group = group,
    callback = function ()
        require('atone').setup({})
    end
})

vim.keymap.set({ 'n', 'v' }, '<localleader>u', '<cmd>Atone toggle<cr>', { desc = 'Undo tree' })
