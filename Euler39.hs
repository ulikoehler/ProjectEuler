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
    let base n = [1..1000] :: [Int]
    let filtBase n = [1..(n - 2)] -- To leave >= 1 space for the other edges
    let solutions n = [(a, b, n - (a + b)) | a <- base n, b <- base n, a < b, (a + b) < (n - 1), isPythagoreanTriplet a b (n - (a + b))]
    let numSolutions n = length $ solutions n
    let ns = [1..1000]
    let numSolutionsMap = zip ns $ parMap rdeepseq numSolutions ns :: [(Int, Int)]
    print $ filter (\(_,n) -> n > 0) numSolutionsMap
