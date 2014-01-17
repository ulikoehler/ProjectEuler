isDivisibleByAll :: [Integer] -> Integer -> Bool
isDivisibleByAll divisors num = all ((==0) . rem num) divisors

main = do
    let divisors = [1..20]
    print $ head $ filter (isDivisibleByAll divisors) [1..]