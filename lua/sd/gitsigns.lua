local hasgs, gs = pcall(require, 'gitsigns')

if not hasgs then
    return
end

gs.setup{}
