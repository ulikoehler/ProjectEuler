{-# LANGUAGE BangPatterns, UnicodeSyntax #-}
import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Data.Set (Set)
import qualified Data.Set as Set

p2 x = x*x
p3 x = x*x*x
p4 x = x*x*x*x

main = do
    let limit = 50000000
    -- Reduce infinite set of primes to initial subset
    let !relevantPrimes = takeWhile (< limit) primes :: [Integer]
    -- Reduce set of primes and pre-square/cube/^4
    -- Only those with ^n < limit could yield a sum < limit
    let !rp2 = filter (< limit) $ map p2 relevantPrimes
    let !rp3 = filter (< limit) $ map p3 relevantPrimes
    let !rp4 = filter (< limit) $ map p4 relevantPrimes
    -- Generate unique list of results
    let generated = [x + y + z | x <- rp2, y <- rp3, z <- rp4]
    let !genSet = filter (< limit) generated
    let !nubbedGenSet = Set.fromList genSet
    print $ Set.size nubbedGenSet