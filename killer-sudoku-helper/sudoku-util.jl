
function combinations_in_cage(
    cg_sum::Integer,
    cg_size::Integer,
    cg_restrictions::Vector{<:Integer} = Int8[]
)
    # Get digits that can be used, so not already used and LE sum
    cg_digits = filter(x -> (x ∉ cg_restrictions) && (x <= cg_sum), 1:9)

    # Get all cg_size length combinations of cg_digits, no reps
    possible_solns = powerset(cg_digits, cg_size, cg_size)

    # Check if sum to right value
    solutions = filter(x -> sum(x) == cg_sum, collect(possible_solns))

    # Sort just to pass tests
    return sort(solutions, by = first)
end

# Steal rosettacode.org powerset as Exercism doesn't let me use Combinatorics.powerset
# Replicate functionality of min/max length of subsets
function powerset(x::Vector{T}, min::Integer = 0, max::Integer = length(x)) where T
    result = Vector{T}[[]]
    for elem in x, j in eachindex(result)
        push!(result, [result[j] ; elem])
    end

    filter!(x -> min <= length(x) <= max, result)

    return result
end