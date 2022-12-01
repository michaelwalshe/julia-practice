function isvalidISBN10(isbn::AbstractString)::Bool
    isbn = collect(isbn)

    # Input validation
    length(isbn) != 10 && return false  # Correct number of digits
    any(.!isdigit.(isbn[1:9])) && return false  # First 9 are numbers 0-9
    isbn[10] ∉ vcat('0':'9', 'X') && return false  # Last is either X or 0-9

    # Calculate sum of digits multiplied by position
    tot = 0
    for (position, value) in enumerate(isbn)
        if position == 10 && value == 'X'
            value = 10
        else
            value = parse(Int, value)
        end
        tot += value * position
    end

    # Valid ISBN10 if total mod 11 is 0
    return tot % 11 == 0
end