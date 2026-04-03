require('vim._core.ui2').enable({})

vim.cmd[[ colorscheme lunaperche ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.winborder = 'rounded'
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.opt.winborder = 'rounded'
vim.diagnostic.config {
	jump = {
		float = {
			source = true,
		},
	},
	underline = false,
}

local group = vim.api.nvim_create_augroup('sd', {})

vim.api.nvim_create_autocmd('PackChanged', {
	group = group,
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == 'nvim-treesitter' and kind == 'update' then
			if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
			vim.cmd('TSUpdate')
		end
	end
})

vim.pack.add({
	'https://github.com/nvim-mini/mini.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/folke/lazydev.nvim',
	'https://github.com/j-hui/fidget.nvim',
})
require('fidget').setup{}

vim.api.nvim_create_autocmd('CmdlineEnter', {
	group = group,
	once = true,
	callback = function ()
		require('mason').setup()
	end
})

vim.api.nvim_create_autocmd('BufEnter', {
	group = group,
	once = true,
	pattern = {'*.lua'},
	callback = function ()
		require('lazydev').setup()
	end
})

vim.api.nvim_create_autocmd('FileType', {
	group = group,
	pattern = { '<filetype>' },
	callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = group,
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- keymaps
		end
		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
		end
	end
})
vim.lsp.enable('lua_ls')
