function pythagorean_triplets(n::Integer)
    triples = []
    for a in 1:n ÷ 3
        # Formula from a^2 + b^2 = c^2 & a + b + c = N
        c = (n^2 - 2*a*n) / (2n -2a)
        b = n - a - c
        t = [a, b, c]
        if t == floor.(t)
            push!(triples, Tuple(sort(t)))
        end
    end

    return unique(triples)
end
