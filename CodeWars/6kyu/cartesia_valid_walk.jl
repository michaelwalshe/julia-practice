

walk = ['n','s','n','s','n','s','n','s','n','s']


function isvalidwalk(walk)
    walk_remap = Dict(
        'n' => im,
        's' => -im,
        'e' => 1,
        'w' => -1
    )

    walk_num = replace(walk, walk_remap...)

    is_circular_walk = sum(walk_num) == 0
    is_10_minutes = sum(abs.(walk_num)) == 10

    return is_circular_walk && is_10_minutes
end