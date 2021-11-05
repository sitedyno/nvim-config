local hasll, ll = pcall(require, 'lualine')

if not hasll then
    print 'Failed to load lualine'
    return
end

local sonokai = require 'sd.lualine-themes.sonokai'

ll.setup {
    options = {
        theme = sonokai,
    },
}
