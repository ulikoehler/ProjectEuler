{-# LANGUAGE BangPatterns, UnicodeSyntax #-}
import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Math.NumberTheory.Primes.Factorisation
import Data.List
import Debug.Trace

primeFactors :: Int -> [Int]
primeFactors n = map (fromIntegral . fst) $ factorise (fromIntegral n)

numPrimeFactors = length . primeFactors


pf4 :: (Int, Int, Int, Int) -> Bool
pf4 (a,b,c,d) =
    (numPrimeFactors a) == 4 && (numPrimeFactors b) == 4 && (numPrimeFactors c) == 4 && (numPrimeFactors d) == 4

main = do
    let num4 = zip4 [1..] [2..] [3..] [4..]
    let num3 = zip3 [1..] [2..] [3..]
    print $ head $ filter pf4 num4