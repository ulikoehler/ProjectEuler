import Data.List (permutations)

readNum :: String -> Integer
readNum num = read num

dn :: String -> Int -> Integer
dn str n = readNum ((take 3 . drop n) str)

divisible :: (Integer, Integer) -> Bool
divisible (x,y) = (rem x y == 0)

isSubstrDivisible :: Integer -> Bool
isSubstrDivisible num = let numstr = show num :: String
                            allD = map (dn numstr) [1..7] :: [Integer]
                            divisors = [2,3,5,7,11,13,17] :: [Integer]
                            dnDivisors = zip allD divisors :: [(Integer, Integer)]
                        in all divisible dnDivisors

pandigitals = let pandigitalStrs = permutations "0123456789"
              in map read pandigitalStrs

main = do
    print $ sum $ filter isSubstrDivisible pandigitals