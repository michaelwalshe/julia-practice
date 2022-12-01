"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year::Integer)
    if (
        year % 4 == 0  # Basic check, is year divisible by 4
        && (
            year % 100 != 0  # Except if also div by 100
            ||
            year % 400 == 0  # Except do allow if div by 400
        )
    )
        return true
    else
        return false
    end
        
end