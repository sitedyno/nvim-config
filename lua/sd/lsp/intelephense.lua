local intelephense = {
    cmd = {
        'podman',
        'container',
        'run',
        '--pid',
        'host',
        '--interactive',
        '--rm',
        '--volume',
        vim.loop.cwd() .. ':' .. vim.loop.cwd(),
        '--workdir',
        vim.loop.cwd(),
        'localhost/intelephense:1.7.1',
        'intelephense',
        '--stdio',
    },
}

return intelephense
