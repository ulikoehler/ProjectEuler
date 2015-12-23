import Math.NumberTheory.Primes.Testing (isPrime)
import Data.List (maximumBy)
import Data.Ord (Ordering)
import Control.Parallel.Strategies
import Debug.Trace

formula a b n = (n*n) + (a*n) + b

findNumPrimes a b = let ns = [0..(abs (max a b))]
                        formulaVals = map (formula a b) ns
                        primes = takeWhile isPrime formulaVals
                        numPrimes = length primes
                    in numPrimes
                    
cartesianProduct lst = [(x, y) | x <- lst, y <- lst]
primesMapMaximum a b =
    compare (thd3 a) (thd3 b)
        where thd3 (_, _, x) = x

-- Optimize by filtering
filterABSpace (a, b)
    | even b = False -- Fast check
    | (not . isPrime) b = False -- n = 0 -> certainly no prime
    | (not . isPrime) (formula a b 40) = False -- Will not produce more than a=1, b=41 variant
    | otherwise = True

main = do
    let space = [-999..999]
    let abSpace = cartesianProduct space
    let filteredABSpace = filter filterABSpace abSpace
    let mapFN = (\ (a,b) -> (a, b, findNumPrimes a b))
    let numPrimesMap = parMap rdeepseq mapFN abSpace
    let numPrimesMapFiltered = filter (\(_,_,n) -> n > 0) numPrimesMap
    let maximumParameters = maximumBy primesMapMaximum numPrimesMapFiltered
    -- print $ length abSpace
    -- print $ length filteredABSpace
    --print $ findNumPrimes 1 41
    --print $ numPrimesMapFiltered
    print maximumParameters