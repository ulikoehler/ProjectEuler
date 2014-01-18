import Math.NumberTheory.Primes.Testing (isPrime)
import Data.List (maximumBy)
import Data.Ord (Ordering)
import Data.Tuple.Utils

formula a b n = (n*n) + (a*n) + b

findNumPrimes a b = let limit = abs a
                        ns = [0..limit]
                        formulaVals = map (formula a b) ns
                        primes = filter isPrime formulaVals
                        numPrimes = length primes
                    in numPrimes
                    
cartesianProduct lst = [(x, y) | x <- lst, y <- lst]

primesMapMaximum a b = compare (thd3 a) (thd3 b)

main = do
    let space = [-1000..1000]
    let abSpace = cartesianProduct space
    let numPrimesMap = map (\ (a,b) -> (a, b, findNumPrimes a b)) abSpace
    let maximumParameters = maximumBy primesMapMaximum numPrimesMap
    print maximumParameters