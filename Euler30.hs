import Control.Parallel.Strategies

power5 x = x * x * x * x * x

digitSumPower5 n = sum $ map power5 $ map (\x -> read [x] :: Int) $ show n

isSameAsDigitSumPower5 n = (n == digitSumPower5 n)

main = do
    let base = [2..10000000]
    let filtered = filter isSameAsDigitSumPower5 base
    let cs = filtered `using` parList rdeepseq
    print $ sum $ cs
