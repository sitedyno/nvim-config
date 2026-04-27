return {
    cmd = {
        'ty',
        'server',
    },
    filetypes = { 'python' },
    -- handlers = {
    --     ['window/showMessage'] = function(_, result)
    --         if result and result.type == vim.lsp.protocol.MessageType.Error then
    --             return -- silence error notifications from ty
    --         end
    --     end,
    -- },
    root_markers = {
        'Pipfile',
        'pyproject.toml',
        'pyrightconfig.json',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
    },
    settings = {
        ty = {
            diagnosticMode = 'workspace',
        },
    },
    single_file_support = true,
}
