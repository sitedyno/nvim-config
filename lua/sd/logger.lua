local function error(...)
    local raw_msg = select(1, ...)
    if type(raw_msg) == 'table' then
        raw_msg = vim.inspect(raw_msg)
    end
    local msg = string.format(raw_msg, ...)
    vim.api.nvim_echo({
        { os.date '%H:%M:%S: ' },
        { msg, 'ErrorMsg' },
    }, true, {})
end

local defaults = {
    log_file = vim.fn.stdpath 'log' .. '/sd.log',
    log_to_echo = true,
    log_to_file = true,
}

local M = {}

M.opts = {}

function M.setup(opts)
    opts = opts or {}
    if next(M.opts) == nil then
        M.opts = vim.tbl_deep_extend('force', defaults, opts)
    else
        M.opts = vim.tbl_deep_extend('force', M.opts, opts)
    end
end

function M.trace(...)
    if vim.g.log_level == 0 then
        M._log(0, ...)
    end
end

function M.debug(...)
    if vim.g.log_level <= 1 then
        M._log(1, ...)
    end
end

function M.info(...)
    if vim.g.log_level <= 2 then
        M._log(2, ...)
    end
end

function M.warn(...)
    if vim.g.log_level <= 3 then
        M._log(3, ...)
    end
end

function M.error(...)
    M._log(4, ...)
end

function M._log(log_type, ...)
    local types = {
        [0] = { hl = 'StdoutMsg', level = 'Trace' },
        [1] = { hl = 'OkMsg', level = 'Debug' },
        [2] = { hl = 'MoreMsg', level = 'Info' },
        [3] = { hl = 'WarningMsg', level = 'Warn' },
        [4] = { hl = 'ErrorMsg', level = 'Error' },
    }
    log_type = types[log_type]
    local _, mic = vim.uv.gettimeofday()
    local raw_msg = select(1, ...)
    if raw_msg and type(raw_msg) == 'table' then
        raw_msg = vim.inspect(raw_msg)
    end
    local msg = string.format(raw_msg, ...)
    M._echo(log_type.hl, string.format('%s:%03d', os.date '%H:%M:%S:', mic / 1000), msg)
    M._log_to_file(log_type.level, string.format('%s:%03d', os.date '%Y-%m-%d %H:%M:%S:', mic / 1000), msg)
end

function M._echo(hl, time, msg)
    if M.opts.log_to_echo then
        vim.api.nvim_echo({
            { time, hl },
            { ' ' },
            { msg },
        }, true, {})
    end
end

function M._log_to_file(level, time, msg)
    if M.opts.log_to_file and vim.fn.filewritable(M.opts.log_file) then
        local file = io.open(M.opts.log_file, 'a')
        local line = time .. ' ' .. level .. ': ' .. msg .. '\n'
        if file then
            file:write(line)
            file:close()
        else
            error('Unable to open log file %s', M.opts.log_file)
        end
    elseif M.opts.log_to_file then
        error('Log file is not writable: %s', M.defaults.log_file)
    end
end

return M
