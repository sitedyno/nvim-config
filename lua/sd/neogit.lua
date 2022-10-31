local hasng, ng = pcall(require, 'neogit')

if not hasng then
    print 'Failed to load neogit'
    return
end

ng.setup {
    disable_commit_confirmation = true,
    integrations = {
        diffview = true,
    },
}
