function encode(s)
    isempty(s) && return s

    # Initialise arrays of counts and chars, and counter
    letters = [s[1]]
    counts = []
    counter = 1
    for c in s[2:end]
        if c == letters[end]
            counter += 1
        else
            counter = counter != 1 ? string(counter) : "_"
            push!(counts, counter)
            push!(letters, c)
            counter = 1
        end
    end
    # Add the last counter to the counts
    counter = counter != 1 ? string(counter) : "_"
    push!(counts, counter)
    
    # Interleave the letters and counts arrays, then join as a string
    output = [(counts) (letters)] |> permutedims |> vec |> join

    # Remove all the _s, unneccesary
    return replace(output, "_" => "")

end



function decode(s)
    decoded_s = ""
    i = 1
    while i <= length(s)
        # Check if current index is number
        if isnumeric(s[i])
            # Check for more digits of the number
            j = 0
            while i + j <= length(s)
                if isnumeric(s[i + j + 1])
                    j += 1
                else
                    break
                end
            end
            # If number, then add num times of the next char to the decoded_s
            decoded_s *= (s[i + j + 1] ^ parse(Int, s[i:(i + j)]))
            # Skip next i, as consumed
            i += 2 + j
        else
            # If no num, then just add character
            decoded_s *= s[i]
            i += 1
        end
    end

    return decoded_s
end
