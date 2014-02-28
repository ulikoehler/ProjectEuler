import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Data.List
import Data.Ord
import Control.Parallel.Strategies

yourFunction = concatMap inits . tails
    where inits = takeWhile (not . null) . iterate init
          tails = takeWhile (not . null) . iterate tail


main = do
    let lim = 1000000
    let basePrimes = takeWhile (<=lim) primes
    let primeList = maximumBy (comparing length) $ filter ((<=lim) . sum) $ filter (isPrime . sum) $ yourFunction basePrimes
    print $ (length primeList, sum primeList)
