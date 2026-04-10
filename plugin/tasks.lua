vim.pack.add {
    'https://github.com/stevearc/overseer.nvim',
}

local function format_project()
    local formatters = {
        stylua = {
            cmd = 'stylua -g **/*.lua',
            config = 'stylua.toml',
        },
    }
    for _, config in pairs(formatters) do
        local found = vim.fn.filereadable(config.config)
        if found then
            local task = require('overseer.task').new { cmd = config.cmd }
            task:start()
        end
    end
end

vim.keymap.set({ 'n', 'v' }, '<leader>fp', format_project, { desc = 'Format Project' })
vim.keymap.set({ 'n', 'v' }, '<leader>to', '<cmd>OverseerToggle<cr>', { desc = 'Toggle Overseer ui' })
