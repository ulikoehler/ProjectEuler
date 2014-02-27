import Data.List
import Data.Ord
import Control.Parallel.Strategies

maxi xs = maximumBy (comparing fst) (zip xs [0..])

power5 x = x * x * x * x * x

digitSumPower5 n = sum $ map power5 $ map (\x -> read [x] :: Int) $ show n

isSameAsDigitSumPower5 n = (n == digitSumPower5 n)

main = do
    let base = [1..500]
    let solutions n = [(a,b,c) | a <- base, b <- base, c <- base, a*a + b*b == c*c, (a+b+c) == n]
    let numSolutions n = (`div` 2) $ length $ solutions n
    let as = (map numSolutions [1..1000])
    let bs = as `using` parList rdeepseq
    print $ maxi $ bs

