local wk = require 'which-key'

local M = {}

function M.setup(client, bufnr)
    local opts = { noremap = true, silent = true }

    local keymap = {
        c = {
            name = '+code',
            r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
            a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
            d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Line Diagnostics' },
            l = {
                name = '+lsp',
                i = { '<cmd>LspInfo<cr>', 'Lsp Info' },
                a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Folder' },
                r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Folder' },
                l = {
                    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                    'List Folders',
                },
            },
        },
        x = {
            s = { '<cmd>Telescope lsp_document_diagnostics<cr>', 'Search Document Diagnostics' },
            w = { '<cmd>Telescope lsp_workspace_diagnostics<cr>', 'Workspace Diagnostics' },
        },
    }

    local keymap_visual = {
        c = {
            name = '+code',
            a = { ':<C-U>lua vim.lsp.buf.range_code_action()<CR>', 'Code Action' },
        },
    }

    local keymap_goto = {
        name = '+goto',
        r = { '<cmd>Telescope lsp_references<cr>', 'References' },
        d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
        dv = { '<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
        ds = { '<Cmd>split | lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
        s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
        I = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
        D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration' },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Goto Type Definition' },
    }

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    wk.register(keymap, { buffer = bufnr, prefix = '<leader>' })
    wk.register(keymap_visual, { buffer = bufnr, prefix = '<leader>', mode = 'v' })
    wk.register(keymap_goto, { buffer = bufnr, prefix = 'g' })
end

return M
