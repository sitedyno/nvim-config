local source = {}

source.new = function()
    return setmetatable({}, { __index = source })
end

---Return this source is available in current context or not. (Optional)
---@return boolean
function source:is_available()
    if string.match(vim.bo.filetype, 'php') then
        return true
    end
    return false
end

---Return the debug name of this source. (Optional)
---@return string
function source:get_debug_name()
    return 'debug name'
end

---Invoke completion. (Required)
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
    -- vim.pretty_print(params.context.cursor_before_line)
    callback { { label = 'foo' } }
end

return source
