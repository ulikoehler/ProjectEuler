import qualified Data.Set as Set
import Data.List ((\\))
import Data.List (nub)
import Math.NumberTheory.Primes.Factorisation

properDivisors :: Integer -> [Integer]
properDivisors n = Set.toList $ (divisors n) Set.\\ (Set.singleton n)

sumProperDivisors = sum . properDivisors

isAbundant n = sumProperDivisors n > n

main = do
    let limit = 29000
    let baseNumberSet = Set.fromList [1..limit]
    let abundantNumbers = filter isAbundant [1..limit]
    let sumAbundantNumbers = Set.fromList [x+y | x <- abundantNumbers, y <- abundantNumbers, (x+y) <= limit]
    let notAbundantSummable = baseNumberSet Set.\\ sumAbundantNumbers
    print $ sum $ Set.toList notAbundantSummable