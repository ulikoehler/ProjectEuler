import Data.List (sort)

concatProduct :: Int -> Int -> String
concatProduct s i =
    let factors = [1..i]
        products = map (*s) factors
    in concatMap show products


isPandigital :: String -> Bool
isPandigital = (== "123456789") . sort


main = do
    let pandigs = filter isPandigital [concatProduct s n | s <- [1..10000], n <- [1..100]]
    let maxPandig = maximum $ map read $ pandigs :: Int
    print maxPandig