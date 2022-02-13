if require 'sd.first_load'() then
    return
end

vim.g.mapleader = ','

require 'sd.options'

require 'sd.which-key'
require 'sd.telescope'
require 'sd.treesitter'
require 'sd.formatter'
require 'sd.projectionist'
require('colorizer').setup()
require 'sd.luasnip'

vim.defer_fn(function()
    require 'sd.plugins'
end, 0)
