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
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1,
                shorting_target = 40,
            },
        },
        lualine_x = {
            {
                require('noice').api.status.mode.get,
                cond = function ()
                    local message = require('noice').api.status.mode.get()
                    return vim.fn.assert_match('recording @', message) == 0
                end,
                color = { fg = custom_sonokai.normal.a.bg },
            },
            'encoding',
            'fileformat',
            'filetype',
        },
    },
}
