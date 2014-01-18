import Data.List (elemIndex)
import Data.Maybe (fromJust)

collatz :: Integer -> [Integer]
collatz n = if n == 1
               then [n]
               else if even n
                    then [n] ++ collatz (quot n 2)
                    else [n] ++ collatz (3*n+1)

findMaximum :: [Int] -> Int
findMaximum lst = let theMax = maximum lst
                  in fromJust (elemIndex theMax lst)

main = do
    let numbers = [1..1000000]
    let collatzLengths = map (length . collatz) numbers
    let maximumInput =  1 + findMaximum collatzLengths -- +1: We start with 1
    print maximumInput