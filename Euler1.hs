import Math.NumberTheory.Primes.Factorisation

isMultipleOf3Or5 :: Integer -> Bool
isMultipleOf3Or5 num = isFactor3Or5 $ map fst $ factorise num

isFactor3Or5 :: [Integer] -> Bool
isFactor3Or5 [] = False
isFactor3Or5 (x:[]) = (x == 3 || x == 5)
isFactor3Or5 (x:xs) = False

main = do
    print $ sum $ filter isMultipleOf3Or5 [1..10]