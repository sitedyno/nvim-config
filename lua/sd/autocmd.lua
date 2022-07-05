-- From https://github.com/numToStr/dotfiles/blob/49a36214d91221108def81715d1792b90f29cf80/neovim/.config/nvim/lua/numToStr/autocmd.lua
local ag = vim.api.nvim_create_augroup('sd', { clear = true })

-- Open help vertically and press q to exit
vim.api.nvim_create_autocmd('BufEnter', {
    group = ag,
    pattern = '*.txt',
    callback = function()
        if vim.bo.buftype == 'help' then
            vim.api.nvim_command 'wincmd L'
        end
    end,
})

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = ag,
    callback = function()
        vim.highlight.on_yank { higroup = 'Visual', timeout = 500 }
        -- This is a workaround for clipboard not working in WSL
        -- see https://github.com/neovim/neovim/issues/19204#issuecomment-1173722375
        if vim.fn.has 'wsl' == 1 then
            vim.fn.system('clip.exe', vim.fn.getreg '"')
        end
    end,
})
