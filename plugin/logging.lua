require('sd.logger').setup {}

local commands_tbl = {
    enable = {
        impl = function(args, _)
            if args[1] == 'echo' then
                require('sd.logger').setup { log_to_echo = true }
            end
            if args[1] == 'file' then
                require('sd.logger').setup { log_to_file = true }
            end
        end,
        complete = function(_)
            return { 'echo', 'file' }
        end,
    },
    disable = {
        impl = function(args, _)
            if args[1] == 'echo' then
                require('sd.logger').setup { log_to_echo = false }
            end
            if args[1] == 'file' then
                require('sd.logger').setup { log_to_file = false }
            end
        end,
        complete = function(_)
            return { 'echo', 'file' }
        end,
    },
}

local group = vim.api.nvim_create_augroup('sd.logger', { clear = true })
-- enable echo command
vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = group,
    callback = function(_)
        vim.api.nvim_create_user_command('Sd', function(opts)
            local fargs = opts.fargs
            local cmd = fargs[1]
            local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
            local command = commands_tbl[cmd]
            if not command then
                vim.notify('Sd: unknown command: ' .. cmd, vim.log.levels.ERROR)
                return
            end
            command.impl(args, opts)
        end, {
            desc = 'Logger Commands',
            nargs = '+',
            complete = function(arg_lead, cmdline, _)
                local subcmd_key, subcmd_arg_lead = cmdline:match "^['<,'>]*Sd[!]*%s(%S+)%s(.*)$"
                if
                    subcmd_key
                    and subcmd_arg_lead
                    and commands_tbl[subcmd_key]
                    and commands_tbl[subcmd_key].complete
                then
                    return commands_tbl[subcmd_key].complete(subcmd_arg_lead)
                end
                if cmdline:match "^['<,'>]*Sd[!]*%s+%w*$" then
                    local keys = vim.tbl_keys(commands_tbl)
                    return vim.iter(keys)
                        :filter(function(k)
                            return k:find(arg_lead) ~= nil
                        end)
                        :totable()
                end
            end,
        })
    end,
})
-- open file logs
-- declare file log path
