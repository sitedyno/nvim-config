local hasng, ng = pcall(require, 'neogit')

if not hasng then
    print('Failed to load neogit')
    return
end


-- this seems to fix https://github.com/TimUntersberger/neogit/issues/206
require 'neogit.status'.dispatch_refresh(true)

ng.setup{
    integrations = {
        diffview = true,
    },
}
