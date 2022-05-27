function to_rna(dna::Char)::Char
    dna_rna_map = Dict(
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U',
    )

    if !haskey(dna_rna_map, dna)
        throw(ErrorException("$(dna) is not a correct nucleotide"))
    end

    return dna_rna_map[dna]
end


function to_rna(dna::String)::String
    return map(c -> to_rna(c), dna)
end