vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/mason-org/mason.nvim',
})
vim.api.nvim_create_autocmd('CmdlineEnter', { once = true, callback = function ()
    require('mason').setup()
end})
vim.lsp.enable('lua_ls')
