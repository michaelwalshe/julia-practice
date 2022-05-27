"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::String)::Bool
    str = lowercase(input)

    alph = Set{Char}("abcdefghijklmnopqrstuvwxyz")

    for c in str
        delete!(alph, c)
    end

    return isempty(alph)
end
