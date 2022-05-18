local cmp = require 'cmp'
local phpactor = require 'phpactor_cmp'
-- vim.notify_once(vim.inspect(cmp))
-- vim.notify_once(vim.inspect(phpactor))
cmp.register_source('phpactor', phpactor.new())
