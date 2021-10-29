-- Misnamed to avoid duplicate config message
-- `nvim -u ~/.vim/luainit.lua` to use

if require 'sd.first_load'() then
    return
end

vim.g.mapleader = ','

require 'sd.options'

require 'sd.which-key'
require 'sd.telescope'
require 'sd.treesitter'

vim.defer_fn(function()
    require('sd.plugins')
end, 0)
