local dashboards = {
    'leap-usage', -- s,S
    'Q_co', -- complex changes
    'Q_lr', -- left/right movement
    'Q_ma', -- marks
    'Q_pa', -- pattern searches
    'Q_sc', -- scrolling
    'Q_tm', -- text object motions
    'Q_to', -- text objects
    'Q_vc', -- various commands
    'Q_vi', -- visual mode
    'ui-messages', -- ui2 stuff
}

local function dashboard()
    local buf = vim.api.nvim_get_current_buf()
    local i = math.random(1, #dashboards)
    local cmd = ':h ' .. dashboards[i]
    vim.cmd(cmd)
    vim.api.nvim_buf_delete(buf, {})
end

local group = vim.api.nvim_create_augroup('sd.init', { clear = true})

vim.api.nvim_create_autocmd('VimEnter', {
    group = group,
    callback = function (_)
        dashboard()
    end
})

