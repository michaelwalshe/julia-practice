function pythagorean_triplets(n::Integer)
    triples = []
    for a in 1:n ÷ 3
        # Formula derived from a^2 + b^2 = c^2 & a + b + c = N
        b = (n^2 - 2*a*n) / (2n -2a)
        c = n - a - b
        t = [a, b, c]
        if (
            t == floor.(t)  # Integer solns to the derived formula
            && issorted(t)  # a < b < c
        )
            push!(triples, Tuple(t))
        end
    end

    return triples
end
