vim.filetype.add {
    extension = {
        yml = function(path, bufnr)
            if vim.fn.glob(path .. 'ansible.cfg') then
                return 'yaml.ansible'
            end
        end,
    },
}
