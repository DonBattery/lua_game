-- This file will be used in the live demo

function factorial(a)
    if a <= 1 then
        return a
    end

    return a * factorial(a - 1)
end

print("Factorial of 5 is: " .. factorial(2))
