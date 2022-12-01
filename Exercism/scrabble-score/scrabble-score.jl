function score(c::Char)::Number
    c = uppercase(c)
    if c in ('A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T')
        return 1
    elseif c in ('D', 'G')
        return 2
    elseif c in ('B', 'C', 'M', 'P')
        return 3
    elseif c in ('F', 'H', 'V', 'W', 'Y')
        return 4
    elseif c == 'K'
        return 5
    elseif c in ('J', 'X')
        return 8
    elseif c in ('Q', 'Z')
        return 10
    else
        return 0
    end
end

function score(str::String)::Number
    letter_scores = str |> uppercase |> collect .|> score
    return sum(letter_scores)
end
