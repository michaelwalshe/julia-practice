const used_names = Set{String}()


function rand_name()::String
    c = 'A':'Z'
    d = '0':'9'
    join(rand(c, 2)) * join(rand(d, 3))
end

function get_robot_name()::String
    # Generate name
    new_name = rand_name()

    # Check for name in used names list, if used then get another
    while new_name ∈ used_names
        new_name = rand_name()
    end

    # Add this name to used_names
    push!(used_names, new_name)

    return new_name
end


mutable struct Robot
    name::String

    function Robot()
        new(get_robot_name())
    end
end

function reset!(instance::Robot)
    instance.name = get_robot_name()

    return nothing
end

function name(instance::Robot)
    return instance.name
end
