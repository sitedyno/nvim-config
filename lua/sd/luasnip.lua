local ls = require 'luasnip'

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.ls_exp_or_jump = function()
    if ls.expand_or_jumpable() then
        return t '<Plug>luasnip-expand-or-jump'
    end
    return ''
end

_G.ls_jump_back = function()
    if ls.jumpable(-1) then
        return t '<Plug>luasnip-jump-prev'
    end
    return ''
end

_G.ls_choose = function()
    if ls.choice_active() then
        return t '<Plug>luasnip-next-choice'
    end
    return ''
end

-- https://github.com/tjdevries/config_manager/blob/bbf0c735cba0b600708969ffcab9e047efd88676/xdg_config/nvim/after/plugin/luasnip.lua
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
-- vim.keymap.set({ "i", "s" }, "<c-k>", function()
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump()
--   end
-- end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
-- vim.api.nvim_set_keymap({ 'i', 's' }, '<c-j>', function()
--     if ls.jumpable(-1) then
--         ls.jump(-1)
--     end
-- end, {
--     silent = true,
-- })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
-- vim.api.nvim_set_keymap('i', '<c-l>', function()
--     if ls.choice_active() then
--         ls.change_choice(1)
--     end
-- end)

vim.api.nvim_set_keymap('i', '<c-k>', 'v:lua.ls_exp_or_jump()', { expr = true })
vim.api.nvim_set_keymap('s', '<c-k>', 'v:lua.ls_exp_or_jump()', { expr = true })
vim.api.nvim_set_keymap('i', '<c-j>', 'v:lua.ls_jump_back()', { expr = true })
vim.api.nvim_set_keymap('s', '<c-j>', 'v:lua.ls_jump_back()', { expr = true })
