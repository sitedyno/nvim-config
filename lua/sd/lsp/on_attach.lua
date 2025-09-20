local wk = require 'which-key'

local M = {}

function M.keymaps(_, bufnr)
    local opts = { noremap = true, silent = true }

    local keymap = {
        { '<leader>c', group = 'code' },
        { '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', desc = 'Code Action' },
        { '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', desc = 'Line Diagnostics' },
        { '<leader>cl', group = 'lsp' },
        { '<leader>cla', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc = 'Add Folder' },
        { '<leader>cli', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
        {
            '<leader>cll',
            '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
            desc = 'List Folders',
        },
        { '<leader>clr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc = 'Remove Folder' },
        { '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', desc = 'Rename' },
        { '<leader>xs', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Search Document Diagnostics' },
        { '<leader>xw', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace Diagnostics' },
    }

    local keymap_visual = {
        { '<leader>c', group = 'code', mode = 'v' },
        { '<leader>ca', ':<C-U>lua vim.lsp.buf.range_code_action()<CR>', desc = 'Code Action', mode = 'v' },
    }

    local keymap_goto = {
        { 'g', group = 'goto' },
        { 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', desc = 'Goto Declaration' },
        { 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', desc = 'Goto Implementation' },
        { 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', desc = 'Goto Definition' },
        { 'grr', '<cmd>Telescope lsp_references<cr>', desc = 'References' },
        { 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', desc = 'Signature Help' },
        { 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', desc = 'Goto Type Definition' },
    }

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    wk.add(keymap, { buffer = bufnr, prefix = '<leader>' })
    wk.add(keymap_visual, { buffer = bufnr, prefix = '<leader>', mode = 'v' })
    wk.add(keymap_goto, { buffer = bufnr, prefix = 'g' })
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
    -- M.formatting(client, bufnr)
end

return M
