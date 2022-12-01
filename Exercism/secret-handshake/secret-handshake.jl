
function secret_handshake(code)
    # Convert code to binary, just get last 5 codes
    bin_code = bitstring(code)[end-4:end]
    # Parse as Booleans for mask
    bin_num = [parse(Bool, x) for x in bin_code]
    
    # What are the list of instructions?
    instructions = ["jump", "close your eyes", "double blink", "wink"]

    # Get instructions using bin_num as mask
    handshake = instructions[bin_num[2:end]]
    
    # Reverse if required, note our instructions are backwards
    if bin_num[1] == true
        return handshake
    else
        return reverse(handshake)
    end
end
