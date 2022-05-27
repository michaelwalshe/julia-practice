"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::String)::Dict
    nuc = Dict(
        'A' => 0,
        'T' => 0,
        'C' => 0,
        'G' => 0
    )
    for x in strand
        if !haskey(nuc, x)
            throw(DomainError(strand))
        end
        nuc[x] += 1
    end
    return nuc
end


count_nucleotides("GATTACA")