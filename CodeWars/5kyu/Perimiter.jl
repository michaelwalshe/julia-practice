module Perimeter
    export perimeter

    function perimeter(n)
        arr = ones(Int64, n + 1)
        for i in 3:(n + 1)
            arr[i] = arr[i - 1] + arr[i - 2]
        end

        return 4 * sum(arr)
    end
end
