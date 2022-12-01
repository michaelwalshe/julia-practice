function rotate(n::Int, val::Char)::Char
    if !(isletter(val))
        return val
    end

    newval = Char((Int(lowercase(val)) + n - 97) % 26 + 97)

    if islowercase(val)
        return newval
    else
        return uppercase(newval)
    end
end

function rotate(n::Int, val::String)
    return map(c -> rotate(n, c), val)
end

macro R13_str(s)
    rotate(13, s)
end

for i in 1:26
    @eval ($(Symbol("@R$(i)_str")))(l::LineNumberNode, m::Module, s::String) = rotate($i, s)
end