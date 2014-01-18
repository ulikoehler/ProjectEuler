triangleNumber 0 = 0
triangleNumber n = n + triangleNumber (n - 1)

triangleNumbers = triangleWorker 1 0
triangleWorker n lastval = let current = n + lastval
                           in [current] ++ triangleWorker (n + 1) current

-- Number of divisors
numDivisors n = length $ filter (==True) $ map ((==0) . rem n) [1..n]

main = do
    let limit = 500
    let numbersOfInterest = filter ((>limit) . numDivisors) triangleNumbers
    print $ head $ numbersOfInterest