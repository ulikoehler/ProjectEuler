{-# LANGUAGE BangPatterns, UnicodeSyntax #-}
import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing

import Data.IntSet (IntSet)
import qualified Data.IntSet as IntSet
import Data.IntSet.Unicode ((∈))

p2 x = x*x
p3 x = x*x*x
p4 x = x*x*x*x

main = do
    let limit = 50000000
    let !relevantPrimes = takeWhile (< limit) primes :: [Integer]
    -- Reduce set of primes and pre-square/cube/^4
    -- Only those with ^n < limit could yield a sum < limit
    let !rp2 = filter (<limit) $ map p2 relevantPrimes
    let !rp3 = filter (<limit) $ map p3 relevantPrimes
    let !rp4 = filter (<limit) $ map p4 relevantPrimes
    let generated = [x + y + z | x <- rp2, y <- rp3, z <- rp4]
    let genSet = filter (< limit) generated
    print $ length genSet