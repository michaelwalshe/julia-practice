function score(x, y)
    dist = sqrt(x^2 + y^2)
    if dist > 10
        return 0
    elseif dist > 5
        return 1
    elseif dist > 1
        return 5
    else
        return 10
    end
end
