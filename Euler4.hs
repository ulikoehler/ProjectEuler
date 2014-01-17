isPalindrome :: Integer -> Bool
isPalindrome int = let lst = show int
                       palTuples = zip lst (reverse lst)
                   in all tupleEq palTuples

tupleEq :: (Eq a0) => (a0, a0) -> Bool
tupleEq tp = (fst tp) == (snd tp)

-- Cartesian product with itself, and multiply the numbers
cartSquareProd :: [Integer] -> [Integer]
cartSquareProd lst = [x * y | x <- lst, y <- lst]

main = do
    let threeDigits = [100..999]
    print $ maximum $ filter isPalindrome $ cartSquareProd threeDigits