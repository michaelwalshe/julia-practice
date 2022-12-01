# https://www.codewars.com/kata/josephus-permutation/


function josephussurvivor(n, k)
    if n == 1
        return 1
    else
        return mod((josephussurvivor(n-1, k) + k - 1), n) + 1
    end
end