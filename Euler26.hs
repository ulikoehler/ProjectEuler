
numSpace = [1..10]


denom :: Int -> Int
denom n = read $ replicate n '9'

f d = filter (\n -> d `mod` n == 0) numSpace

main = do
    print $ f $ denom 6