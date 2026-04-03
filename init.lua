require('vim._core.ui2').enable({})

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

	end
end })

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

vim.lsp.enable('lua_ls')
