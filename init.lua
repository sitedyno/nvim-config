if require 'sd.first_load'() then
    return
end

vim.g.mapleader = ','

require 'sd.options'

require 'sd.which-key'
require 'sd.telescope'
require 'sd.treesitter'

vim.defer_fn(function()
    require 'sd.plugins'
end, 0)
