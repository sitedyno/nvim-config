vim.pack.add {
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/folke/lazydev.nvim',
    'https://github.com/j-hui/fidget.nvim',
}

local group = vim.api.nvim_create_augroup('sd.lsp', {})

vim.api.nvim_create_autocmd('BufEnter', {
    group = group,
    once = true,
    pattern = { '*.lua' },
    callback = function()
        require('lazydev').setup()
    end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	group = group,
-- 	callback = function(ev)
-- 		vim.print('LspAttach')
-- 		-- require('fidget').setup()
-- 		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
-- 		if client:supports_method('textDocument/implementation') then
-- 			-- keymaps
-- 		end
-- 		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
-- 		if client:supports_method('textDocument/completion') then
-- 			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
-- 			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
-- 			-- client.server_capabilities.completionProvider.triggerCharacters = chars
-- 			-- vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
-- 		end
-- 	end
-- })

require('fidget').setup { notification = { override_vim_notify = true } }
require('mason').setup()

local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
            }
        }
    },
})
-- vim.lsp.log.set_level('trace')

vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

vim.keymap.set({ 'n', 'v' }, '<localleader>M', '<cmd>Mason<cr>', { desc = 'Mason' })
