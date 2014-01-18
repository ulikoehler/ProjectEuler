sumSquare :: [Integer] -> Integer
sumSquare nums = let theSum = sum nums
                 in theSum * theSum

squareSum :: [Integer] -> Integer
squareSum nums = sum $ map (\ x -> x*x) nums

sumDiff :: [Integer] -> Integer
sumDiff nums = (sumSquare nums) - (squareSum nums)

main = do
    let nums = [1..100]
    print $ sumDiff nums