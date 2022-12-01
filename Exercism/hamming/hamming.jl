"Your optional docstring here"
function distance(a, b)
    if isempty(a) && isempty(b)
        return 0
    end
    if length(a) != length(b)
        throw(ArgumentError("Input strings must be of equal length"))
    end

    sum(ai != bi for (ai, bi) in zip(a, b))
end