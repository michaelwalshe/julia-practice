const NORTH = 0 + 1im  # round(exp(im * π / 2))
const EAST = 1 + 0im  # round(exp(im * 0))
const SOUTH = -0 - 1im  # round(exp(im * 3π / 2))
const WEST = -1 + 0im  # round(exp(im * π))

struct Point
    x::Integer
    y::Integer
end

mutable struct Robot
    position::Point
    heading::Complex

    function Robot(position::Tuple{Integer, Integer}, heading::Complex)
        new(Point(position...), heading)
    end
end

position(r::Robot) = r.position
heading(r::Robot) = r.heading

function turn_left!(r::Robot)
    r.heading = round(r.heading * exp(im * π / 2))
    return r
end

function turn_right!(r::Robot)
    r.heading = round(r.heading * exp(im * -π / 2))
    return r
end

function advance!(r::Robot)
    p = r.position
    d = r.heading
    x = round(p.x + cos(-im * log(d)))
    y = round(p.y + sin(-im * log(d)))

    r.position = Point(x, y)

    return r
end

function move!(r::Robot, instr::String)
    destr = Dict(
        'R' => turn_right!,
        'L' => turn_left!,
        'A' => advance!
    )

    for instruction in instr
        r = destr[instruction](r)
    end

    return r
end