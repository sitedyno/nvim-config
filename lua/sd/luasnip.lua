local ls = require 'luasnip'

local tc = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.ls_exp_or_jump = function()
    if ls.expand_or_jumpable() then
        return tc '<Plug>luasnip-expand-or-jump'
    end
    return ''
end

_G.ls_jump_back = function()
    if ls.jumpable(-1) then
        return tc '<Plug>luasnip-jump-prev'
    end
    return ''
end

_G.ls_choose = function()
    if ls.choice_active() then
        return tc '<Plug>luasnip-next-choice'
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

local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require 'luasnip.util.events'
-- local ai = require 'luasnip.nodes.absolute_indexer'

ls.add_snippets(nil, {
    markdown = {
        s('ac', {
            t {
                '# CARD',
                '## Front',
                '',
            },
            i(1),
            t {
                '',
                '```',
                '',
            },
            i(2),
            t {
                '',
                '```',
                '## Back',
                '',
            },
            i(3),
            t {
                '',
                '',
            },
            i(0),
        }),
    },
})
