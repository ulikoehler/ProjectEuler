

choose :: Integer -> Integer -> Integer
choose n 0 = 1
choose 0 k = 0
choose n k = choose (n-1) (k-1) * n `div` k


forAllR :: Integer -> [Integer]
forAllR n = map (\r -> choose n r) [1..n]

count p = length . filter p

larger1M = count ((<) 1000000)

main = do
    print $ larger1M $ concatMap forAllR [1..100]