local wk = require 'which-key'

local M = {}

function M.keymaps(_, bufnr)
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
            s = { '<cmd>Telescope diagnostics bufnr=0<cr>', 'Search Document Diagnostics' },
            w = { '<cmd>Telescope diagnostics<cr>', 'Workspace Diagnostics' },
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

function M.highlights(client)
    -- thanks TJ https://github.com/tjdevries/config_manager/blob/5c203cee84071e5456dfe755e8f69cfc58dac7cf/xdg_config/nvim/lua/tj/lsp/init.lua#L136
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
    end
end

function M.formatting(client, bufnr)
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
            end,
        })
    end
end

function M.on_attach(client, bufnr)
    M.keymaps(client, bufnr)
    M.highlights(client)
    M.formatting(client, bufnr)
end

return M
