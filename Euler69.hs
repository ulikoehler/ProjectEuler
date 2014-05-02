import Math.Sieve.Phi
import Data.List

limit = 1000000

{-# NOINLINE phiSieve #-}
phiSieve = sieve limit

nPhiN :: Int -> Float
nPhiN n = (fromIntegral n) / (fromIntegral $ phi phiSieve n)

main = do
    let 
    let 
    print $ maximumBy (\a b -> compare (nPhiN a) (nPhiN b)) [1..limit]