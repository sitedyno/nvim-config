local hasgs, gs = pcall(require, 'gitsigns')

if not hasgs then
    print 'Failed to load gitsigns'
    return
end

gs.setup {}
