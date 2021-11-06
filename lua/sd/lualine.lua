local hasll, ll = pcall(require, 'lualine')

if not hasll then
    print 'Failed to load lualine'
    return
end

local custom_sonokai = require 'lualine.themes.sonokai'
local bg_red = custom_sonokai.visual.a.bg
local bg_blue = custom_sonokai.normal.a.bg
custom_sonokai.normal.a.bg = bg_red
custom_sonokai.visual.a.bg = bg_blue

ll.setup {
    options = {
        theme = custom_sonokai,
    },
}
