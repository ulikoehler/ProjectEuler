{-# LANGUAGE NoMonomorphismRestriction, BangPatterns #-}
import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Data.List
import Data.IntSet (IntSet)
import qualified Data.IntSet as IntSet
import Control.Parallel.Strategies

limit = 1000000

{-# NOINLINE primeSet #-}
primeSet :: IntSet
primeSet = IntSet.fromList $ map fromIntegral $ takeWhile (< limit) primes

myIsPrime :: Int -> Bool
myIsPrime i = IntSet.member i primeSet

consecutivesFromI :: Int -- ^ Starting index (0-based)
                  -> [Int] -- ^ Original list
                  -> [[Int]] -- ^ List of lists
consecutivesFromI i xs =
    let list' = drop i xs
        len = length list'
    in map (`take` list') [2..len]

sumLen x = (sum x, length x)

-- Filters
primeAndLimit x = fstLimit x && fstIsPrime x
fstIsPrime = myIsPrime . fromIntegral . fst
fstLimit = (>) limit . fst

consecSumLen xs n =
    let sumLens = map sumLen $ consecutivesFromI n xs
        limitedSumLens = takeWhile ((>) limit . fst) sumLens
    in filter fstIsPrime limitedSumLens

main = do
    let !relevantPrimes = IntSet.toList $ primeSet
    let !numPrimes = length relevantPrimes
    -- n primes, starting at prime i (i: 0-based)
    let parMapped = concat $ parMap rdeepseq (consecSumLen relevantPrimes) [0..numPrimes]
    let longestSumPrime = fst $ maximumBy (\(_,l1) (_,l2) -> compare l1 l2) parMapped
    print longestSumPrime