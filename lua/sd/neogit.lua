local neogit = require('neogit')

-- this seems to fix https://github.com/TimUntersberger/neogit/issues/206
require 'neogit.status'.dispatch_refresh(true)

neogit.setup{
    integrations = {
        diffview = true,
    },
}
