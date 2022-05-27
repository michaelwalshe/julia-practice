using Dates

mutable struct Clock
    hours::Int64
    minutes::Int64

    function Clock(hours::Int64, minutes::Int64)

        # Convert minutes to hours and add to hours
        hours += minutes ÷ 60

        # If minutes were negative but not 60, then fix off by 1
        if minutes < 0 && mod(minutes, 60) != 0
            hours -= 1
        end
        
        # Calculate new minutes and hours
        minutes = mod(minutes, 60)
        hours = mod(hours, 24)

        new(hours, minutes)
    end
end

# Define addition for clocks and minutes
Base.:+(x::Clock, y::Dates.Minute) = Clock(x.hours, x.minutes + y.value)

# Define subtraction for clocks and minutes
Base.:-(x::Clock, y::Dates.Minute) = Clock(x.hours, x.minutes - y.value)

# Define struct comparison
Base.:(==)(x::Clock, y::Clock) = (x.hours == y.hours) && (x.minutes == y.minutes)

# Define printing
Base.show(io::IO, c::Clock) = begin
    h = lpad(c.hours, 2, "0")
    m = lpad(c.minutes, 2, "0")
    print(io, "\"$h:$m\"")
end