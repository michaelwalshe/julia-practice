module Solution
export rgb

hex(n) = string(n, base=16, pad=2)

function cutoff(n)
    n <= 0 && return 0
    n >= 255 && return 255
    return n
end

rgb(n) = (uppercase ∘ hex ∘ cutoff)(n)

rgb(r, g, b) = rgb(r) * rgb(g) * rgb(b)

end