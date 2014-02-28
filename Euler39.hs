import Data.List
import Data.Ord
import Control.Parallel.Strategies

squareRoot :: Int -> Double
squareRoot = sqrt . (fromIntegral :: Int -> Double)

maxi xs = maximumBy (comparing fst) 

power5 x = x * x * x * x * x

digitSumPower5 n = sum $ map power5 $ map (\x -> read [x] :: Int) $ show n

isSameAsDigitSumPower5 n = (n == digitSumPower5 n)

isPythagoreanTriplet a b c = ((a * a) + (b * b) == (c * c))

main = do
    let base = [1..1000] :: [Int]
    let solutions n = [(a,b) | a <- base, b <- base, c <- base, isPythagoreanTriplet a b c, (a+b+c) == n]
    let numSolutions n = (`div` 2) $ length $ solutions n
    print $ zip (map numSolutions [1..1000]) [1..]

