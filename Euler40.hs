
champernowne :: String
champernowne =
    let cnext n = (show n) ++ cnext (n+1)
    in cnext 1

-- Champernowne digit n
cnum :: Int -> Int
cnum n = read [champernowne !! (n - 1)]

main = do
    print $ product $ map cnum [1, 10, 100, 1000, 10000, 100000, 1000000]
