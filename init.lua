vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == 'nvim-treesitter' and kind == 'update' then
		if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
		vim.cmd('TSUpdate')
	end
end })

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/mason-org/mason.nvim',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/folke/lazydev.nvim',
})
vim.api.nvim_create_autocmd('CmdlineEnter', { once = true, callback = function ()
    require('mason').setup()
end})
vim.api.nvim_create_autocmd('BufEnter', {
	once = true,
	pattern = {'*.lua'},
	callback = function ()
		require('lazydev').setup()
	end
})

vim.lsp.enable('lua_ls')
